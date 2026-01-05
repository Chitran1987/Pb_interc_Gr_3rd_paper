rm(list=ls())
load(file = 'STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda')
load(file = 'FFT_map_STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda')
plot2D.arr(img.tens)
plot2D.arr(map.img.tens)

#Small graphene-specific image
img.gr.sm <- img_2_arr(source.png = 'm1_Z RetraceUp Tue Jan 24 14.50.13 2023 [6-6]_70mV_100pA.png', x.lim = c(0, 6.115), y.lim = c(0, 6.115))
save(img.gr.sm, file = 'STM_img_Jan24_14.50.13_2023_[6-6]_70mV_100pA.rda')

#Small R3G specific image
img.R3G.sm <- img_2_arr(source.png = 'm1_Z RetraceUp Tue Jan 24 15.18.12 2023 [6-8]_10mV_100pA.png', x.lim = c(0, 6.115), y.lim = c(0, 6.115))
save(img.R3G.sm, file = 'STM_img_Jan24_15.18.12_2023_[6-8]_10mV_100pA.rda')
