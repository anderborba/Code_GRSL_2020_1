% Adapted by Anderson Borba data: 01/07/2020 version 1.0
% Ref see article
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
%
function[IF] = fus_svd(IM, m, n, nc)
% MSVD based image fusion demo 
% by Dr. VPS Naidu, MSDF Lab
% ref:Image Fusion Technique using Multi-resolution Singular Value Decomposition,
%       Defence Science Journal, Vol. 61, No.5, pp.479-484, Sep. 2011.
%apply MSVD
[X1, U1] = MSVD(IM(:, :, 1));
[X2, U2] = MSVD(IM(:, :, 2));
[X3, U3] = MSVD(IM(:, :, 3));

%fusion starts
X.LL = (X1.LL + X2.LL + X2.LL) / nc;

D     = max(X1.LH, X2.LH) >= 0; 
Xa.LH = D.*X1.LH + (~D).*X2.LH;
D     = max(Xa.LH, X3.LH) >= 0; 
X.LH  = D.*Xa.LH + (~D).*X3.LH;
D     = max(X1.HL, X2.HL) >= 0; 
Xa.HL = D.*X1.HL + (~D).*X2.HL;
D     = max(Xa.HL, X3.HL) >= 0; 
X.HL  = D.*Xa.HL + (~D).*X3.HL;
D     = max(X1.HH, X2.HH) >= 0; 
Xa.HH = D.*X1.HH + (~D).*X2.HH;
D     = max( Xa.HH, X3.HH) >= 0; 
X.HH  = D.*Xa.HH + (~D).*X3.HH;

%XX = [X.LL, X.LH; X.HL, X.HH];
U = (U1 + U2 + U3) / nc;

%apply IMSVD
IF = IMSVD(X,U);
