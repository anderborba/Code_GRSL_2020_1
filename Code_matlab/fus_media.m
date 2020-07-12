% Coded by Anderson Borba data: 01/07/2020 version 1.0
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
% 
% Description (Function)
% Does the roc fusion method
% Input
%       1) E - Evidences matrix
%       2) m, n > 0 -  Matrix dimansion 
%       3) nc > 0 - channel numbers 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output 
% 1) The image fusion  
% Obs:  1) contact email: anderborba@gmail.com
function [F] = fus_media(E, m, n, nc)
soma(1:m, 1:n) = 0.0;
for i = 1: nc
	soma(:, :) = soma(:, :) + E(:, :, i); 
end
F = soma / nc;
