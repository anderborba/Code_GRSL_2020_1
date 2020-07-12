function [Pauli_Image] = show_Pauli(S,index,control)
% Pauli representation of S PolSAR data & save to .bmp 
% This Matlab function is used by main program, "SDNLM.m"
% Input:
%  S: PolSAR data (9 bands , S(:,:,9))
%  index: integer to enumerate the images to show
%  control: variable to write the observed data (0) or the filtered one (1)
%  or none (=~ 0,=~ 1);
% Output:
%  []
% Important: if data are in Scattering format, Pauli's representation is
% the one expected. If data are in other format (Covariance format), the
% data is represented resembling Pauli's -like representation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SDNLM: Stochastic Non-local Means Polarimetric Filter
% From: (1) L. Torres, S. J. SantAnna, C. da Costa Freitas, and A. C. Frery, 
% Speckle reduction in polarimetric SAR imagery with stochastic distances
% and nonlocal means, Pattern Recognition, vol. 47, no. 1, pp. 141-157, 2014.
% Coded in Matlab by Luis Gomez, July 2018 for getting result shown in:
% (2) D. Santana-Cedrés, L. Gomez, L. Alvarez and A. C. Frery,"Despeckling
% PolSAR images with a structure tensor filter", under revision in
% IEEE-GRSL.
% Please, refer the publications (1) and (2.
% Contact to luis.gomez@ulpgc.es to inform about problems using this code.
% Luis Gomez, July 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ihh = real(S(:,:,1));
Ihv = real(S(:,:,2));
Ivv = real(S(:,:,3));
Ihh=sqrt(abs(Ihh));Ihv=sqrt(abs(Ihv))/sqrt(2);Ivv=sqrt(abs(Ivv));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We employ Pauli's Representation
R   = abs(Ihh - Ivv);
G   = (2*Ihv);
B =  abs(Ihh + Ivv);
R = histeq(R);
G = histeq(G);
B = histeq(B);
II = cat(3,R,G,B);
HSV = rgb2hsv(II);
Heq = histeq(HSV(:,:,3));
HSV_mod = HSV;
HSV_mod(:,:,3) = Heq;
Pauli_Image= hsv2rgb(HSV_mod);
%figure(index),imshow(Pauli_Image);
%if(control == 0)
%    title('Observed Data (noisy data).');
% AAB Modified
%    imwrite(Pauli_Image,'Observed_data.bmp');
%elseif(control == 1)
%    title('SDNLM Filtered Data');
% AAB Modified
%    imwrite(Pauli_Image,'Filtered_data.bmp');
%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SDNLM: Stochastic Non-local Means Polarimetric Filter
% From: (1) L. Torres, S. J. Sant’Anna, C. da Costa Freitas, and A. C. Frery, 
% “Speckle reduction in polarimetric SAR imagery with stochastic distances
% and nonlocal means,” Pattern Recognition, vol. 47, no. 1, pp. 141–157, 2014.
% Coded in Matlab by Luis Gomez, July 2018 for getting result shown in:
% (2) D. Santana-Cedrés, L. Gomez, L. Alvarez and A. C. Frery,"Despeckling
% PolSAR images with a structure tensor filter", under revision in
% IEEE-GRSL.
% Please, refer the publications (1) and (2.
% Contact to luis.gomez@ulpgc.es to inform about problems using this code.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Luis Gomez, July 2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
