rm(list = ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)
ClearPlot()

#Load the dataset
load(file = 'STM_img_Jan24_14.50.13_2023_[6-6]_70mV_100pA.rda')
plot2D.arr(img.gr.sm)
f_img.gr.sm <- fft_2D(tens = img.gr.sm, pl='amp')
f_img.gr.sm <- f_img.gr.sm[[1]]

#Pick out the area of interest
f_img.gr.sm <- plot2D.zoom(arr = f_img.gr.sm, center = c(0,0), Del_X = 100, Del_Y = 100)

####mask out the middle
#draw boxes
z.box <- c(-3, -3, 3, 3)
z.mat <- matrix(data = z.box, ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f_img.gr.sm, box.mat = z.mat, box.thick = 0.01, box_intens = 0.1)
#mask the middle
f_img.gr.sm <- mask.arr.box(tens = f_img.gr.sm, box.vec = z.box)
f_img.gr.sm <- plot2D.zoom(f_img.gr.sm, center = c(0,0), Del_X = 80, Del_Y = 80)

#Now draw the boxes
plot2D.arr(f_img.gr.sm)
vec1 <- c(23, 10, 33, 20, -33, -20, -23, -10)
vec2 <- c(21.5, -22, 31.5, -12, -31.5, 12, -21.5, 22)
vec <- c(vec1, vec2)
b.mat <- matrix(data = vec, ncol = 4, byrow = T)
dmp <- plot2D.boxes(img.tens = f_img.gr.sm, box.mat = b.mat, box.thick = 0.1, box_intens = 0.3)

#Now check for zooms
plot2D.arr(img.gr.sm)
dmp <- plot2D.zoom(img.gr.sm, center = c(4,3), Del_X =2, Del_Y = 2 )
f_dmp <- fft_2D(dmp, pl='amp')
f_dmp <- f_dmp[[1]]
dmp <- plot2D.zoom(f_dmp, center = c(0,0), Del_X = 80, Del_Y = 80)

#Now run the mapping algorithm
map.img.gr.sm <- fft_2D_map(img.tens = img.gr.sm, DelX = 1.5, DelY = 1.5, k1st = b.mat, k0=z.box)
save(map.img.gr.sm, file = 'FFT_map_STM_img_Jan24_14.50.13_2023_[6-6]_70mV_100pA.rda')
