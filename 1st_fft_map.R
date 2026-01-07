rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)
img.tens <- img_2_arr(source.png = "m1_Z RetraceUp Tue Jan 24 13.40.14 2023 [6-1]_1.0V_100pA.png", x.lim = c(0, 6.115), y.lim = c(0, 6.115), bgrnd = 0)
f_img <- fft_2D(tens = img.tens, pl='amp')
f_img <- f_img[[1]]
f_img <- plot2D.zoom(arr = f_img, center = c(0,0), Del_X = 100, Del_Y = 100)

###Determine the box co-ordinates for the 1st order spots
vec1 <- c(17, -7.5, 28, 3.5, -28, -3.5, -17, 7.5)
vec2 <- c(5, 15, 16, 26, -16, -26, -5, -15)
vec3 <- c(6.5, -25, 17.5, -14, -15, 15, -4, 26)
box.mat <- matrix(data = c(vec1, vec2, vec3), ncol = 4, byrow = T)
plot2D.arr(f_img)
dmp <- plot2D.boxes(img.tens = f_img, box.mat = box.mat, box.thick = 0.01, box_intens = 0.05)

###Determine the box co-ordinates for the (0,0) spot
box.zer <- matrix(data = c(-2.5,-2.5,2.5,2.5), ncol = 4, byrow = T)
plot2D.arr(f_img)
dmp1 <- plot2D.boxes(img.tens = f_img, box.mat = box.zer, box.thick = 0.01, box_intens = 0.05)
k0.vec <- c(-2.5, -2.5, 2.5, 2.5)

###Determine the DelX and DelY for the fft_2D_map() function
plot2D.arr(img.tens)
dmp1 <- plot2D.zoom(arr=img.tens, center = c(3,2.75), Del_X = 1, Del_Y = 1)
f_dmp1 <- fft_2D(dmp1, pl='amp')

###Start the fft_2D_map
map.img.tens <- fft_2D_map(img.tens = img.tens, DelX = 1.0, DelY = 1.0, k1st = box.mat, k0 = k0.vec)

###Compare to the img.tens image
plot2D.arr(img.tens)
plot2D.arr(map.img.tens)
save(img.tens, file = 'STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda')
save(map.img.tens, file = 'FFT_map_STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda')
