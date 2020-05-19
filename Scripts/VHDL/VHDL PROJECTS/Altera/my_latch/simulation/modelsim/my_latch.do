view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue U -period 10ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/my_latch/S 
wave create -driver freeze -pattern clock -initialvalue U -period 20ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/my_latch/R 
WaveCollapseAll -1
wave clipboard restore
