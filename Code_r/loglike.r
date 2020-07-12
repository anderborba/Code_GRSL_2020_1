# Article submitted 
# Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
# GRSL - IEEE Geoscience and Remote Sensing Letters 
# Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
# Despriction (function)
# Finds the l(L, mu) using log-likelihood, (internal side)
# Input: L, mu > 0                                
#        
# Output: l(L, mu) - log-likelihood 
loglike <- function(param){
	L    <- param[1]
	mu   <- param[2]
	aux1 <- L * log(L)
  	aux2 <- L * sum(log(z[1: j])) / j
  	aux3 <- L * log(mu) 
  	aux4 <- log(gamma(L))
  	aux5 <- (L / mu) * sum(z[1: j]) / j 
  	ll   <- aux1 + aux2 - aux3 - aux4 - aux5 
	return(ll)
	}

