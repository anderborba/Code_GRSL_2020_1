% Coded by Anderson Borba data: 01/07/2020 version 1.0
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
% 
% Description
% 1) GT to Flevoland region 1 
%  
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output 
% 1) Print this information in txt files
% 2) Show the image to Flevoland with ROI-I 
% Obs: 1) prints commands are commented with %  
%      2) contact email: anderborba@gmail.com

format long;
cd ..
cd ..
cd ..
cd Data
load AirSAR_Flevoland_Enxuto.mat
[nrows, ncols, nc] = size(S);
cd ..
cd Code/Code_art_grsl_2020_tengarss/Code_matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
II = show_Pauli(S, 1, 0);
%%%%%%%%%%%%%%%%%%%i%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 750;
n = 1024;
GT = zeros(m, n);
%%%%%%%%%%% ROIs %%%%%%%%%%%%%%%%%%
imshow(II)
%
axis on
hold on;
impixelinfo;
for i= 159:310
GT(287, i) = 1;
plot(i, 287,'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	
for j= 288:330
GT(j, 159) = 1;	
plot(159, j,'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	
for i= 159:310
GT(331, i) = 1;
plot(i, 331,'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	
for j= 288:331
GT(j, 310) = 1;
plot(310, j,'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	
%cd ..
%cd ..
%cd Data
%fname = sprintf('gt_flevoland.txt');
%fid = fopen(fname,'w');
%for i = 1: m
%	for j = 1: n
%                fprintf(fid,'%f ', GT(i,j));
%        end
%        fprintf(fid,'\r\n');
%end
%fclose(fid); 
%cd ..
%cd Code/Code_matlab
