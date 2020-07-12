% Adapted by Anderson Borba data: 01/07/2020 version 1.0
% Ref see article
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
%
% Coded by VPS Naidu, MSDF Lab, NAL, Bangalore
function [F] = fus_dwt(E, m, n, nc)
[A1,H1,V1,D1] = dwt2(E(:, :, 1), 'db2');
[A2,H2,V2,D2] = dwt2(E(:, :, 2), 'db2');
[A3,H3,V3,D3] = dwt2(E(:, :, 3), 'db2');
Af   = (A1 + A2 + A3) / nc;
AUX1 = max(H1  , H2);
Hf   = max(AUX1, H3);
AUX2 = max(V1  , V2);
Vf   = max(AUX2, V3);
AUX3 = max(D1  , D2);
Df   = max(AUX3, D3);
% fused image
F = idwt2(Af,Hf,Vf,Df,'db2');
