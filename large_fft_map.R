rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)

###Convert image to array
img.large <- img_2_arr(source.png = "m1_Z RetraceUp Tue Jan 24 13.23.39 2023 [5-1]_1.0V_100pA.png", x.lim = c(0, 19.091), y.lim = c(0, 19.091))
save(img.large, file = "STM_img_Tue_Jan24_13.23.39_2023_[5-1]_1.0V_100pA.rda")

###Convert image to fft and visualize
f_img.large <- fft_2D(tens = img.large, pl = 'amp')
f_img.large <- f_img.large[[1]]
f_img.large <- plot2D.zoom(arr = f_img.large, center = c(0,0), Del_X = 20, Del_Y = 20)

###Build the box matrix around the SiC spots
vec1 <- c(3.75, -1.5, 6.75, 1.5, -6.75, -1.5, -3.75, 1.5) ###For the horizontal spots
vec2 <- c(1.5, 3.5, 4.5, 6.5, -4, 3.5, -1, 6.5)
vec3 <- c(-4.5, -6.5, -1.5, -3.5, 0.75, -6.5, 3.75, -3.5)
b.mat <- matrix(data = c(vec1, vec2, vec3), ncol = 4, byrow = T)
plot2D.arr(arr = f_img.large)
dmp <- plot2D.boxes(img.tens = f_img.large, box.mat = b.mat, box.thick = 0.01, box_intens = 0.05)

###Build the k0 vector for the (0,0) spots
vec.zer <- c(-0.75, -0.75, 0.75, 0.75 )
zer.vec <- matrix(data = vec.zer, ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f_img.large, box.mat = zer.vec, box.thick = 0.01, box_intens = 0.1)
k0.vec <- vec.zer

#Decide the Del_X and Del_Y for the mapping
plot2D.arr(arr = img.large)
dmp <- plot2D.zoom(arr = img.large, center = c(11,7.5), Del_X = 1, Del_Y = 1)
f.dmp <- fft_2D(tens = dmp, pl='amp')

###Call the fft_2D_map() function
map.img.large <- fft_2D_map(img.tens = img.large, DelX = 1, DelY = 1, k1st = b.mat, k0 = k0.vec)

###Save as .rda for later use
save(img.large, file = "STM_img_Jan24_13.23.39_2023_[5-1]_1.0V_100pA.rda")
save(map.img.large, file = "FFT_map_STM_img_Jan24_13.23.39_2023_[5-1]_1.0V_100pA.rda")
