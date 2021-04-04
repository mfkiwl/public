`ifdef FPGA
	`include "log.vh"
`endif

module fifo_bus_read #(
	parameter DATA_LEN = 16,
	parameter DEPTH = `BUS_FIFO_DEPTH,
	parameter ADDR_LEN = `C_LOG_2(DEPTH),
	parameter NUM_PIPELINE_STAGES = 0
	
)
(

	input clk,
	input rstn,

	input [DATA_LEN-1:0] wr_data,
	input wr_en,
	input rd_en,

	output reg [DATA_LEN-1:0] rd_data,

	output reg full,
	output  empty_w
);

reg [ADDR_LEN-1:0] wr_addr,rd_addr;
reg empty;
wire full_w;
wire [ADDR_LEN-1:0] wr_addr_plus1,wr_addr_plus1_p,wr_addr_plus2_p,wr_addr_plus3_p,rd_addr_plus1;

assign wr_addr_plus1 = wr_addr +{{(ADDR_LEN-1){1'b0}},1'b1};
assign wr_addr_plus1_p = wr_addr +{{(ADDR_LEN-1){1'b0}},1'b1}+NUM_PIPELINE_STAGES;
assign wr_addr_plus2_p = wr_addr +{{(ADDR_LEN-2){1'b0}},2'd2}+NUM_PIPELINE_STAGES;
assign wr_addr_plus3_p = wr_addr +{{(ADDR_LEN-2){1'b0}},2'd3}+NUM_PIPELINE_STAGES;
assign rd_addr_plus1 = rd_addr +{{(ADDR_LEN-1){1'b0}},1'b1};


assign full_w = (wr_addr_plus2_p == rd_addr) || wr_addr_plus1_p == rd_addr || (wr_addr_plus3_p == rd_addr);
assign empty_w =   (rd_addr == wr_addr); //rd_addr_plus1 == wr_addr ||

always @(posedge clk or negedge rstn) begin
	if(~rstn) begin 
		wr_addr <= {(ADDR_LEN-1){1'b0}};
		full <= 1'b0;
	end
	else if(wr_en ) begin
		wr_addr <= wr_addr_plus1[ADDR_LEN-1:0];
		full <= full_w;
	end
	else begin
		wr_addr <= wr_addr;
		full <= full_w;
	end
end

always @(posedge clk or negedge rstn) begin
	if(~rstn) begin 
		rd_addr <= {(ADDR_LEN-1){1'b0}};
		empty <= 1'b1;
	end
	else if(rd_en && ~empty_w) begin
		rd_addr <= rd_addr_plus1[ADDR_LEN-1:0];
		empty <= empty_w;
	end
	else begin
		rd_addr <= rd_addr;
		empty <= empty_w;
	end
end


reg [DATA_LEN-1:0] mem[0:DEPTH-1];

always @(posedge clk ) begin
	if(wr_en)
		mem[wr_addr] = wr_data;
end
always @(posedge clk) begin
	if(rd_en)
		rd_data <= mem[rd_addr];
end

endmodule

