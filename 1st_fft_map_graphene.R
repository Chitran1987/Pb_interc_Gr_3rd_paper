rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)
load(file = 'STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda')
plot2D.arr(img.tens)

####Check the fft of the STM image
f_img <- fft_2D(img.tens, pl='amp')
f_img <- f_img[[1]]

####ARea of interest
f_img <- plot2D.zoom(arr = f_img, center = c(0,0), Del_X = 80, Del_Y = 80)

####Block out the (0,0) spot
b.mat <- matrix(data = c(-3,-3,3,3), ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f_img, box.mat = b.mat, box.thick = 0.01, box_intens = 0.2)

mask <- (f_img[,,2] >= -3) & (f_img[,,2] <= 3) & (f_img[,,3] >= -3) & (f_img[,,3] <= 3)
f_img[,,1][mask] <- min(f_img[,,1])
plot2D.arr(f_img)

####Create the box matrixes for the 1st order spots
vec1 <- c(23.5, 11.375, 31.5, 19.375, -31.5, -19.375, -23.5, -11.375)
vec2 <- c(22.75, -20.375, 30.75, -12.375, -30.75, 12.375, -22.75, 20.375 )
vec3 <- c(-7, -35, 6, -27 , -6, 27, 7, 35)
b.mat <- matrix(data = c(vec1, vec2, vec3), ncol = 4, byrow = T)
plot2D.arr(f_img)
dmp <- plot2D.boxes(img.tens = f_img, box.mat = b.mat, box.thick = 0.01, box_intens = 0.1)

####Create the (0,0) box matrix and vector
f_img <- fft_2D(img.tens, pl='amp')
f_img <- f_img[[1]]
f_img <- plot2D.zoom(arr = f_img, center = c(0,0), Del_X = 80, Del_Y = 80)
z.mat <- matrix(data = c(-3, -3,3,3), ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f_img, box.mat = z.mat, box_intens = 0.1, box.thick = 0.01)
k0.vec <- c(-3, -3, 3, 3)

####Check the fft with the DelX and DelY
plot2D.arr(img.tens)
dmp <- plot2D.zoom(arr = img.tens, center = c(3,4), Del_X = 1, Del_Y = 1)
f.dmp <- fft_2D(dmp, pl = 'amp')
f.dmp <- f.dmp[[1]]
plot2D.zoom(f.dmp, center = c(0,0), Del_X = 80, Del_Y = 80)

####Call the fft_2D_map function
map.gr.img.tens <- fft_2D_map(img.tens = img.tens, DelX = 1, DelY = 1, k1st = b.mat, k0 = k0.vec)
