rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)

#Load the dataset
load(file='STM_img_Jan24_15.18.12_2023_[6-8]_10mV_100pA.rda')
latt <- img.R3G.sm
plot2D.arr(latt)

#Call the fft
f.latt <- fft_2D(tens = latt, pl='amp')
f.latt <- f.latt[[1]] #Get the amp spectra
f.latt <- plot2D.zoom(f.latt, center = c(0,0), Del_X = 100, Del_Y = 100)

#kill the (0,0) spot
v <- c(-3,-3,3,3)
v.mat <- matrix(data = v, ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f.latt, box.mat = v.mat, box.thick = 0.01, box_intens = 0.1)
f.latt <- mask.arr.box(tens = f.latt, box.vec = v)

#Plot the boxes for the 1st order spots
v1 <- c(13,-6, 23, 4, -23, -4, -13, 6)
v2 <- c(5, -22, 15, -12, -15, -21, -5, -11)
v3 <- c(5, 11, 15, 21, -15, 11.5, -5, 21.5)
vnew <- c(v1, v2, v3)
b.mat <- matrix(data = vnew, ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f.latt, box.mat = b.mat, box.thick = 0.01, box_intens = 0.1)

#Check for DelX and DelY
plot2D.arr(latt)
dmp <- plot2D.win.sig(tens = latt, center = c(3,3), k=10, Xspan = 1.0, Yspan = 1)
dmp <- fft_2D(dmp, pl='amp')

#Call the map
map.img.R3G.sm <- fft_2D_map(img.tens = latt, DelX = 1, DelY = 1, k1st = b.mat, k0 = v)
