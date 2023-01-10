# This script was written and developed by ABKGroup students at UCSD. However, the underlying commands and reports are copyrighted by Cadence.
# We thank Cadence for granting permission to share our research to help promote and foster the next generation of innovators.
setObjFPlanBox Instance u_mem_if/AXI_RD_BUF_3__read_buffer/genblk1_fifo_DP 1693.0 962.0 1763.0 1197.0 
dbSet [dbGet top.insts.name -p u_mem_if/AXI_RD_BUF_3__read_buffer/genblk1_fifo_DP].orient R0
createPlaceBlockage -type hard -box  1691.0 960.0 1765.0 1199.0 -inst u_mem_if/AXI_RD_BUF_3__read_buffer/genblk1_fifo_DP 
createPlaceBlockage -type soft -box  1688.0 957.0 1768.0 1202.0 -inst u_mem_if/AXI_RD_BUF_3__read_buffer/genblk1_fifo_DP 
setObjFPlanBox Instance u_mem_if/AXI_RD_BUF_2__read_buffer/genblk1_fifo_DP 1773.0 962.0 1843.0 1197.0 
dbSet [dbGet top.insts.name -p u_mem_if/AXI_RD_BUF_2__read_buffer/genblk1_fifo_DP].orient R0
createPlaceBlockage -type hard -box  1771.0 960.0 1845.0 1199.0 -inst u_mem_if/AXI_RD_BUF_2__read_buffer/genblk1_fifo_DP 
createPlaceBlockage -type soft -box  1768.0 957.0 1848.0 1202.0 -inst u_mem_if/AXI_RD_BUF_2__read_buffer/genblk1_fifo_DP 
setObjFPlanBox Instance u_mem_if/AXI_RD_BUF_1__read_buffer/genblk1_fifo_DP 1853.0 962.0 1923.0 1197.0 
dbSet [dbGet top.insts.name -p u_mem_if/AXI_RD_BUF_1__read_buffer/genblk1_fifo_DP].orient R0
createPlaceBlockage -type hard -box  1851.0 960.0 1925.0 1199.0 -inst u_mem_if/AXI_RD_BUF_1__read_buffer/genblk1_fifo_DP 
createPlaceBlockage -type soft -box  1848.0 957.0 1928.0 1202.0 -inst u_mem_if/AXI_RD_BUF_1__read_buffer/genblk1_fifo_DP 
setObjFPlanBox Instance u_mem_if/AXI_RD_BUF_0__read_buffer/genblk1_fifo_DP 1933.0 962.0 2003.0 1197.0 
dbSet [dbGet top.insts.name -p u_mem_if/AXI_RD_BUF_0__read_buffer/genblk1_fifo_DP].orient R0
createPlaceBlockage -type hard -box  1931.0 960.0 2005.0 1199.0 -inst u_mem_if/AXI_RD_BUF_0__read_buffer/genblk1_fifo_DP 
createPlaceBlockage -type soft -box  1928.0 957.0 2008.0 1202.0 -inst u_mem_if/AXI_RD_BUF_0__read_buffer/genblk1_fifo_DP 