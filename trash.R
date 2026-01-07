rm(list = ls())
library(StatsChitran)
library(ImageMetrologyAnalysis)

#####################################1st image#################################################
load(file = 'FFT_map_gr_STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda') #Original Image
load(file = 'STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda') #Graphene
load(file = 'FFT_map_STM_img_Jan_24_13.40.14_2023_[6-1]_1.0V_100pA.rda') #SiC map
#####################################1st image#################################################

#####################################2nd image#################################################
load(file = 'STM_img_Jan24_14.50.13_2023_[6-6]_70mV_100pA.rda') #Original Image
load(file = 'FFT_map_STM_img_Jan24_14.50.13_2023_[6-6]_70mV_100pA.rda') #Graphene map
load(file = 'FFT_map_R3G_STM_img_Jan24_14.50.13_2023_[6-6]_70mV_100pA.rda') #R3G map
#####################################2nd image#################################################

#####################################3rd image#################################################
load(file='STM_img_Jan24_15.18.12_2023_[6-8]_10mV_100pA.rda') #Original Image
load(file = 'FFT_map_STM_img_Jan24_15.18.12_2023_[6-8]_10mV_100pA.rda') #R3G map
#####################################3rd image#################################################

#####################################4th image (large image) #################################################
load(file = "STM_img_Tue_Jan24_13.23.39_2023_[5-1]_1.0V_100pA.rda") #Original image
load(file = "FFT_map_STM_img_Jan24_13.23.39_2023_[5-1]_1.0V_100pA.rda") #SiC map
load(file = 'FFT_map_gr_STM_img_Tue_Jan24_13.23.39_2023_[5-1]_1.0V_100pA.rda') #Gr map
##Do a map of graphene and R3G if possible
#####################################4th image (large image) #################################################


#Plotting
plot2D.arr(arr = img.large)
plot2D.arr(arr = map.img.large.gr)


