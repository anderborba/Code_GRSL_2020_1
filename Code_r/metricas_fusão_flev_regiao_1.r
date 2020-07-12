# Coded by Anderson Borba data: 07/07/2020 version 1.0
# Article submitted: 
# Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
# GRSL - IEEE Geoscience and Remote Sensing Letters 
# Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
# Description
# Does the error probability function
# Input:  Ground Truth to Flevoland in the region I 
#         Fusion image to Flevoland in the region I (all methods)
# Output: Plot the error probability function
#
rm(list = ls())
require(ggplot2)
require(latex2exp)
library(hrbrthemes)
require(extrafont)
loadfonts()
#
setwd("../../..")
setwd("Data")
mat <- scan('metricas_fusao_flevoland.txt')
setwd("..")
setwd("Code/Code_art_grsl_2020_tengarss/Code_r")
mat <- matrix(mat,  ncol = 10, byrow = TRUE)
nk <- 10
x       <- seq(0, nk - 1, 1)
freq_f1 <- matrix(0, 0, nk)
freq_f2 <- matrix(0, 0, nk)
freq_f3 <- matrix(0, 0, nk)
freq_f4 <- matrix(0, 0, nk)
freq_f5 <- matrix(0, 0, nk)
freq_f6 <- matrix(0, 0, nk)
for(k in 1: nk){
  freq_f1[k] <- mat[1, k]
  freq_f2[k] <- mat[2, k]
  freq_f3[k] <- mat[3, k]
  freq_f4[k] <- mat[4, k]
  freq_f5[k] <- mat[5, k]
  freq_f6[k] <- mat[6, k]
}
df <- data.frame(x = x, y1 = freq_f1, y2 = freq_f2, y3 = freq_f3, y4 = freq_f4, y5 = freq_f5, y6 = freq_f6)
alpha <- c(1,2,3,4,5,6)
p <- ggplot(df) 
pp <- p + geom_line(aes(x = x, y = y1, color = "Aver")  , size=4, alpha=.7) +
  geom_line(aes(x = x, y = y2, color = "PCA")   , size=4, alpha=.7, linetype = 3) +
  geom_line(aes(x = x, y = y4, color = "MR-DWT"), size=4, alpha=.7) +
  geom_line(aes(x = x, y = y3, color = "MR-SWT"), size=4, alpha=.7) +
  geom_line(aes(x = x, y = y5, color = "ROC")   , size=4, alpha=.7) +
  geom_line(aes(x = x, y = y6, color = "MR-SVD"), size=4, alpha=.7) +
  ylim(.01,1) +
  ylab(TeX('Probability')) +
  xlab(TeX('Detection error')) +
  theme_ipsum(base_family = "Times New Roman", 
              base_size = 20, axis_title_size = 20) +
  scale_fill_ipsum() +
  theme(legend.title = element_blank()) +
  theme(plot.margin=grid::unit(c(0,0,0,0), "mm"),
  )

print(pp)
