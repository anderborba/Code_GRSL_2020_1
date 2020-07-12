% Coded by Anderson Borba data: 01/07/2020 version 1.0
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
% 
% Description
% 1) GT to San Francisco Bay  
%  
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output 
% 1) Print this information in txt files
% 2) Show the image to San Francisco with ROI 
% Obs: 1) prints commands are commented with %  
%      2) contact email: anderborba@gmail.com

clear all;
format long;
cd ..
cd Data
load SanFrancisco_Bay.mat
[m, n, nc] = size(S);
cd ..
cd Code_matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
II = show_Pauli(S, 1, 0);
%%%%%%%%%%%%%%%%%%%i%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GT = zeros(m, n);
imshow(II)
%
axis on
hold on;
impixelinfo;
%%%%%%%%%%% ROIs %%%%%%%%%%%%%%%%%%
x0 = 194;
y0 = 361;
xf = 255;
yf = 355;
[myline, input_dados, outmat, x, y ] = bresenham(II, [x0, y0; xf, yf], 0); 
dim = length(x)
for i= 1: dim
GT(x(i), y(i)) = 1;
plot(y(i), x(i),'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	
x0 = 191;
y0 = 420;
xf = 185;
yf = 365;
[myline, input_dados, outmat, x, y ] = bresenham(II, [x0, y0; xf, yf], 0); 
dim = length(x)
for i= 1: dim
GT(x(i), y(i)) = 1;
plot(y(i), x(i),'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	
x0 = 194;
y0 = 361;
xf = 185;
yf = 365;
[myline, input_dados, outmat, x, y ] = bresenham(II, [x0, y0; xf, yf], 0); 
dim = length(x)
for i= 1: dim
GT(x(i), y(i)) = 1;
plot(y(i), x(i),'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end
%%% Show ground truth %%%%%%%%%%%%%%%%%
imshow(GT)
cd ..
cd Data
fname = sprintf('gt_san_fran.txt');
fid = fopen(fname,'w');
for i = 1: m
	for j = 1: n
               fprintf(fid,'%f ', GT(i,j));
        end
        fprintf(fid,'\r\n');
end
fclose(fid); 
cd ..
cd Code_matlab
