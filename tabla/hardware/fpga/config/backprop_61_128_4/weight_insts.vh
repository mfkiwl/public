`define WEIGHT_COUNT_MACRO(lanes,pe) (\
(lanes == 0 && pe == 0) ? 16'd0 : \
(lanes == 0 && pe == 1) ? 16'd0 : \
(lanes == 0 && pe == 2) ? 16'd0 : \
(lanes == 0 && pe == 3) ? 16'd0 : \
(lanes == 0 && pe == 4) ? 16'd0 : \
(lanes == 1 && pe == 0) ? 16'd269 : \
(lanes == 1 && pe == 1) ? 16'd138 : \
(lanes == 1 && pe == 2) ? 16'd140 : \
(lanes == 1 && pe == 3) ? 16'd141 : \
(lanes == 1 && pe == 4) ? 16'd688 : \
(lanes == 2 && pe == 0) ? 16'd291 : \
(lanes == 2 && pe == 1) ? 16'd145 : \
(lanes == 2 && pe == 2) ? 16'd150 : \
(lanes == 2 && pe == 3) ? 16'd148 : \
(lanes == 2 && pe == 4) ? 16'd734 : \
(lanes == 3 && pe == 0) ? 16'd260 : \
(lanes == 3 && pe == 1) ? 16'd149 : \
(lanes == 3 && pe == 2) ? 16'd147 : \
(lanes == 3 && pe == 3) ? 16'd149 : \
(lanes == 3 && pe == 4) ? 16'd705 : \
(lanes == 4 && pe == 0) ? 16'd258 : \
(lanes == 4 && pe == 1) ? 16'd133 : \
(lanes == 4 && pe == 2) ? 16'd136 : \
(lanes == 4 && pe == 3) ? 16'd135 : \
(lanes == 4 && pe == 4) ? 16'd662 : \
(lanes == 5 && pe == 0) ? 16'd260 : \
(lanes == 5 && pe == 1) ? 16'd134 : \
(lanes == 5 && pe == 2) ? 16'd128 : \
(lanes == 5 && pe == 3) ? 16'd135 : \
(lanes == 5 && pe == 4) ? 16'd657 : \
(lanes == 6 && pe == 0) ? 16'd130 : \
(lanes == 6 && pe == 1) ? 16'd135 : \
(lanes == 6 && pe == 2) ? 16'd135 : \
(lanes == 6 && pe == 3) ? 16'd128 : \
(lanes == 6 && pe == 4) ? 16'd528 : \
(lanes == 7 && pe == 0) ? 16'd128 : \
(lanes == 7 && pe == 1) ? 16'd134 : \
(lanes == 7 && pe == 2) ? 16'd128 : \
(lanes == 7 && pe == 3) ? 16'd128 : \
(lanes == 7 && pe == 4) ? 16'd518 : \
(lanes == 8 && pe == 0) ? 16'd0 : \
(lanes == 8 && pe == 1) ? 16'd0 : \
(lanes == 8 && pe == 2) ? 16'd0 : \
(lanes == 8 && pe == 3) ? 16'd0 : \
(lanes == 8 && pe == 4) ? 16'd0 : \
(lanes == 9 && pe == 0) ? 16'd140 : \
(lanes == 9 && pe == 1) ? 16'd140 : \
(lanes == 9 && pe == 2) ? 16'd142 : \
(lanes == 9 && pe == 3) ? 16'd141 : \
(lanes == 9 && pe == 4) ? 16'd563 : \
(lanes == 10 && pe == 0) ? 16'd161 : \
(lanes == 10 && pe == 1) ? 16'd158 : \
(lanes == 10 && pe == 2) ? 16'd160 : \
(lanes == 10 && pe == 3) ? 16'd148 : \
(lanes == 10 && pe == 4) ? 16'd627 : \
(lanes == 11 && pe == 0) ? 16'd137 : \
(lanes == 11 && pe == 1) ? 16'd137 : \
(lanes == 11 && pe == 2) ? 16'd136 : \
(lanes == 11 && pe == 3) ? 16'd146 : \
(lanes == 11 && pe == 4) ? 16'd556 : \
(lanes == 12 && pe == 0) ? 16'd128 : \
(lanes == 12 && pe == 1) ? 16'd128 : \
(lanes == 12 && pe == 2) ? 16'd137 : \
(lanes == 12 && pe == 3) ? 16'd131 : \
(lanes == 12 && pe == 4) ? 16'd524 : \
(lanes == 13 && pe == 0) ? 16'd128 : \
(lanes == 13 && pe == 1) ? 16'd128 : \
(lanes == 13 && pe == 2) ? 16'd128 : \
(lanes == 13 && pe == 3) ? 16'd128 : \
(lanes == 13 && pe == 4) ? 16'd512 : \
(lanes == 14 && pe == 0) ? 16'd128 : \
(lanes == 14 && pe == 1) ? 16'd128 : \
(lanes == 14 && pe == 2) ? 16'd132 : \
(lanes == 14 && pe == 3) ? 16'd128 : \
(lanes == 14 && pe == 4) ? 16'd516 : \
(lanes == 15 && pe == 0) ? 16'd134 : \
(lanes == 15 && pe == 1) ? 16'd133 : \
(lanes == 15 && pe == 2) ? 16'd133 : \
(lanes == 15 && pe == 3) ? 16'd130 : \
16'd530)