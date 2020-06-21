view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue U -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/flipflop_sinc/S 
wave create -driver freeze -pattern clock -initialvalue U -period 50ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/flipflop_sinc/R 
wave create -driver freeze -pattern clock -initialvalue U -period 25ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/flipflop_sinc/CLK 
WaveCollapseAll -1
wave clipboard restore
