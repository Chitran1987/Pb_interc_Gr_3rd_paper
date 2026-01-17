rm(list = ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)

#Load the dataset
load(file = 'STM_img_Jan24_14.08.14_2023_[6-3] _0.5V_100pA.rda')
plot2D.arr(img.500mV)

#Build the FFT
f_img <- fft_2D(tens = img.500mV, pl = 'amp')
f_img <- f_img[[1]] #Select the amplitude spectra
f_img <- mask.arr.box(tens = f_img, box.vec = c(-1,-1,1,1)) #Remove the zero-frequency harmonic
f_img <- plot2D.zoom(arr = f_img, center = c(0,0), Del_X = 80, Del_Y = 80)

#Plot the boxes around the SiC spots
vec1 <- c(17, -7.5, 28, 3.5, -28, -3.5, -17, 7.5)
vec2 <- c(5, 15, 16, 26, -16, -26, -5, -15)
vec3 <- c(6.5, -25, 17.5, -14, -15, 15, -4, 26)
b.mat <- matrix(data = c(vec1, vec2, vec3), ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f_img, box.mat = b.mat, box.thick = 0.01, box_intens = 0.2)

#Plot the boxes around the zero-freq (0,0) spot
z.vec <- c(-8,-8, 8, 8)
z.mat <- matrix(data = z.vec, nrow = 1, byrow = T)
dmp1 <- plot2D.boxes(img.tens = f_img, box.mat = z.mat, box.thick = 0.01, box_intens = 0.2)

##Decide the Del_X and Del_Y for the mapping
plot2D.arr(arr = img.500mV)
dmp <- plot2D.win.sig(tens = img.500mV, center=c(3, 4), Xspan = 1, Yspan = 1, k=10)
f.dmp <- fft_2D(tens = dmp, pl='amp')
f.dmp <- plot2D.zoom(f.dmp[[1]], center = c(0,0), Del_X = 80, Del_Y = 80)
f.dmp <- mask.arr.box(tens = f.dmp, box.vec = c(-7.5,-7.5,7.5,7.5))
dmp <- plot2D.boxes(img.tens = f.dmp, box.mat = b.mat, box.thick = 0.01, box_intens = 0.1)

###Call the fft_2D_map() function
map.img.500mV.SiC <- fft_2D_map(img.tens = img.500mV, DelX = 1, DelY = 1, k1st = b.mat, k0 = z.vec)
