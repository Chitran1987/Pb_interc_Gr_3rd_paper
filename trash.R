rm(list = ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)

load(file = 'FFT_map_gr_STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda')
load(file = 'STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda')

#Plot the images to know
plot2D.arr(arr = img.tens)
plot2D.arr(arr = map.gr.img.tens)
