% Adapted by Anderson Borba data: 01/07/2020 version 1.0
% Ref see article
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
%
% Coded by VPS Naidu, MSDF Lab, NAL, Bangalore
function [F] = fus_pca(E, m, n, nc)
for i = 1: nc
	COVAR(:, i) = reshape(E(:, :, i), m * n, 1);
end
C = cov(COVAR);
[V, D] = eig(C);
p = V(:, nc)./ sum(V(:, nc));
F = zeros(m, n);
aux = zeros(m, n);
for i = 1: nc
	aux(:, :) = E(:, :, i);
	F = F + p(i) * aux;
end
