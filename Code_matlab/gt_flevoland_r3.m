% Coded by Anderson Borba data: 01/07/2020 version 1.0
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
% 
% Description
% 1) GT to Flevoland region 2 
%  
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output 
% 1) Print this information in txt files
% 2) Show the imege to Flevoland with ROI-II 
% Obs: 1) prints commands are commented with %  
%      2) contact email: anderborba@gmail.com

clear all;
format long;
cd ..
cd Data
load AirSAR_Flevoland_Enxuto.mat
[nrows, ncols, nc] = size(S);
cd ..
cd Code_matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
II = show_Pauli(S, 1, 0);
%%%%%%%%%%%%%%%%%%%i%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 750;
n = 1024;
GT = zeros(m, n);
%%%%%%%%%%% show flevond image %%%%%%%%%%%%%%%%%%
imshow(II)
%
axis on
hold on;
impixelinfo;
% set region
x0 = m / 2 + 305;
y0 = n / 2 + 77;
xf = m / 2 + 237;
yf = n / 2 + 77;
[myline, input_dados, outmat, x, y ] = bresenham(II, [x0, y0; xf, yf], 0); 
dim = length(x);
for i= 1: dim
GT(x(i), y(i)) = 1;
plot(y(i), x(i),'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	
x0 = m / 2 + 243;
y0 = n / 2 + 20;
xf = m / 2 + 237;
yf = n / 2 + 77;
[myline, input_dados, outmat, x, y ] = bresenham(II, [x0, y0; xf, yf], 0); 
dim = length(x);
for i= 1: dim
GT(x(i), y(i)) = 1;
plot(y(i), x(i),'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	
%%%%%%%%%%% show gt %%%%%%%%%%%%%%%%%%
imshow(GT)
%
cd ..
cd Data
fname = sprintf('gt_flevoland.txt');
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
