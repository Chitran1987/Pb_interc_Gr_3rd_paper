rm(list=ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)

#Load the image
load(file = "STM_img_Tue_Jan24_13.23.39_2023_[5-1]_1.0V_100pA.rda")

###Convert image to fft and visualize
f_img.large <- fft_2D(tens = img.large, pl = 'amp')
f_img.large <- f_img.large[[1]]
f_img.large <- plot2D.zoom(arr = f_img.large, center = c(0,0), Del_X = 80, Del_Y = 80)

###Take out the (0,0) spots
##plot2D boxes around the (0,0) spots
v <- c(-7.5,-7.5,7.5,7.5)
v.mat <- matrix(data = v, ncol = 4, byrow = T)
dmp <- plot2D.boxes(f_img.large, box.mat = v.mat, box_intens = 0.1, box.thick = 0.1)
##mask out the box
f_img.large <- mask.arr.box(tens = f_img.large, box.vec = v.mat)


###Build the box matrix around the graphene spots
###Determine the box co-ordinates for the 1st order spots
vec1 <- c(23.5, 11.375, 31.5, 19.375, -31.5, -19.375, -23.5, -11.375)
vec2 <- c(22.75, -20.375, 30.75, -12.375, -30.75, 12.375, -22.75, 20.375 )
vec3 <- c(-5, -37, 3, -29 , -3, 29, 5, 37)
b.mat <- matrix(data = c(vec1, vec2, vec3), ncol = 4, byrow = T)
plot2D.arr(arr = f_img.large)
dmp <- plot2D.boxes(img.tens = f_img.large, box.mat = b.mat, box.thick = 0.01, box_intens = 0.05)



#Decide the Del_X and Del_Y for the mapping
plot2D.arr(arr = img.large)
dmp <- plot2D.win.sig(tens = img.large, center=c(11, 10), Xspan = 1, Yspan = 1, k=10)
f.dmp <- fft_2D(tens = dmp, pl='amp')
f.dmp <- plot2D.zoom(f.dmp[[1]], center = c(0,0), Del_X = 80, Del_Y = 80)
f.dmp <- mask.arr.box(tens = f.dmp, box.vec = c(-7.5,-7.5,7.5,7.5))
dmp <- plot2D.boxes(img.tens = f.dmp, box.mat = b.mat, box.thick = 0.01, box_intens = 0.1)

###Call the fft_2D_map() function
map.img.large.gr <- fft_2D_map(img.tens = img.large, DelX = 1, DelY = 1, k1st = b.mat, k0 = v)
save(map.img.large.gr, file = 'FFT_map_gr_STM_img_Tue_Jan24_13.23.39_2023_[5-1]_1.0V_100pA.rda' )
