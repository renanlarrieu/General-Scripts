view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue U -period 10ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/my_and/a 
wave create -driver freeze -pattern clock -initialvalue U -period 20ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/my_and/b 
WaveCollapseAll -1
wave clipboard restore
