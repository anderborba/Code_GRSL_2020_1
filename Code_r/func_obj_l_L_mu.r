# Coded by Anderson Borba data: 07/07/2020 version 1.0
# Article submitted 
# Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
# GRSL - IEEE Geoscience and Remote Sensing Letters 
# Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
# Despriction (function)
# Finds the l(j) using total-likelihood
# Input: Le, Ld, mue e mud > 0 estimed parameters 
#        
# Output: pixel j - Edge evidence estimated
func_obj_l_L_mu <- function(param){
  j <- param
  Le <- matdf1[j,1]
  Ld <- matdf2[j,1]
  mue <- matdf1[j,2]
  mud <- matdf2[j,2]
  #
  aux1 <- Le * log(Le)
  aux2 <- Le * sum(log(z[1: j])) / j
  aux3 <- Le * log(mue)
  aux4 <- log(gamma(Le))
  aux5 <- (Le / mue) *  sum(z[1:j]) / j
  #
  aux6  <- Ld * log(Ld)
  aux7  <- Ld * sum(log(z[(j + 1): N])) / (N - j)
  aux8  <- Ld * log(mud) 
  aux9  <- log(gamma(Ld)) 
  aux10 <- (Ld / mud) * sum(z[(j + 1): N]) / (N - j) 
  #
  a1 <-  aux1 + aux2 - aux3 - aux4 - aux5
  a2 <-  aux6 + aux7 - aux8 - aux9 - aux10
  #### Beware! The signal is negative because GenSA finds the point of minimum
  func_obj_l_L_mu <- -(j * a1 + (N - j) * a2)   
  return(func_obj_l_L_mu)
}
