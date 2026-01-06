rm(list = ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)

#Load the datasets
load(file='STM_img_Jan24_14.50.13_2023_[6-6]_70mV_100pA.rda')
latt <- img.gr.sm
plot2D.arr(img.gr.sm)

#Check the fft
f_im.gr.sm <- fft_2D(tens = img.gr.sm, pl='amp')
f_im.gr.sm <- f_im.gr.sm[[1]]
f_im.gr.sm <- plot2D.zoom(arr = f_im.gr.sm, center = c(0,0), Del_X = 100, Del_Y = 100)

##Kill the (0,0) spot
#plot boxes around the (0,0) spot
z.vec <- c(-3, -3, 3, 3)
z.mat <- matrix(data = z.vec, ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f_im.gr.sm, box.mat = z.mat, box.thick = 0.01, box_intens = 0.1)
#kill the (0,0) spot
f_im.gr.sm <- mask.arr.box(tens = f_im.gr.sm, box.vec = z.mat)

##Build the boxes around the 1st order spots
v1 <- c(14, 26.5, 24, 36.5, -22, 27.5, -12, 37.5)
v2 <- c(12.5, -37.5, 22.5, -27.5, -23.75, -36, -13.75, -26)
v3 <- NULL
v <- c(v1, v2, v3)
b.mat <- matrix(data = v, ncol = 4, byrow = T)
plot2D.arr(f_im.gr.sm)
dmp <- plot2D.boxes(f_im.gr.sm, box.mat = b.mat, box.thick = 0.01, box_intens = 0.1)

##Check the DelX and DelY ranges
plot2D.arr(img.gr.sm)
dmp <- plot2D.win.sig(img.gr.sm, center = c(2.5, 3.75), k=10, Xspan = 1.5, Yspan = 1.5)
f.dmp <- fft_2D(dmp, pl = 'amp')
f.dmp <- f.dmp[[1]]
f.dmp <- plot2D.zoom(f.dmp, center = c(0,0), Del_X = 100, Del_Y = 100)




##Call the map function
map.img.gr.sm_R3G <- fft_2D_map(img.tens = img.gr.sm, DelX = 1.5, DelY = 1.5, k1st = b.mat, k0 = z.vec)

















