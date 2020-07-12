% Coded by Anderson Borba data: 01/07/2020 version 1.0
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
% 
% Description
% 1) Read *.txt with edge evidence  
% 2) Does the fusion method to San Francisco Bay (one at a times)
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output 
% 2) Show the image (evidences ou fusion)  
% Obs:  1) contact email: anderborba@gmail.com
%       
clear all;
format long;
cd ..
cd Data
load SanFrancisco_Bay.mat
[nrows, ncols, nc] = size(S);
cd ..
cd Code_matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
II = show_Pauli(S, 1, 0);
%%%%%%%%%%%%%%%%%%%i%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IT = zeros(nrows, ncols); 
IF = zeros(nrows, ncols); 

x0 = nrows / 2 + 120;
y0 = ncols / 2 - 260;
r = 120;
num_radial = 25;
t = linspace(0, 2 * pi, num_radial) ;
x = x0 + r .* cos(t);
y = y0 + r .* sin(t);
xr= round(x);
yr= round(y);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ..
cd Data
ev_hh = load('evidence_san_fran_hh.txt');
ev_hv = load('evidence_san_fran_hv.txt');
ev_vv = load('evidence_san_fran_vv.txt');
%
xc = load('xc_san_fran.txt');
yc = load('yc_san_fran.txt');
cd ..
cd Code_matlab
for i = 1: num_radial 
ev(i, 1) = round(ev_hh(i, 3));
ev(i, 2) = round(ev_hv(i, 3));
ev(i, 3) = round(ev_vv(i, 3));
end
nc = 3;
m = 450;
n = 600;
for i = 1: nc
	IM = zeros(m, n, nc);
end
for canal = 1 : nc
	for i = 1: num_radial
        		ik =  ev(i, canal); 
			IM( yc(i, ik), xc(i, ik), canal) = 1;
	end
end
nt = 20
tempo = zeros(1, nt);
for i=1: nt
tic;
[IF] = fus_media(IM, m, n, nc);
%[IF] = fus_pca(IM, m, n, nc);
%[IF] = fus_swt(IM, m, n, nc);
%[IF] = fus_dwt(IM, m, n, nc);
%[IF] = fus_roc(IM, m, n, nc);
%[IF] = fus_maior_voto(IM, m, n, nc);
%[IF] = fus_svd(IM, m, n, nc);
tempo(i) = toc;
end
t= sum(tempo(1:nt)) / nt;
%%%%%%%%%%% ROIs %%%%%%%%%%%%%%%%%%
imshow(II)
% plot fusion
[xpixel, ypixel, valor] = find(IF > 0);
%plot edge evidences hh(1), hv(2) e vv(3)
%[xpixel, ypixel, valor] = find(IM(:, :, 3) > 0);
%
axis on
hold on;

dpixel = size(xpixel);
for i= 1: dpixel(1)
			plot(ypixel(i), xpixel(i),'ro',...
    				'LineWidth',1.0,...
    				'MarkerSize',3.5,...
    				'MarkerEdgeColor',[0.85 0.325 0.089],...
    				'MarkerFaceColor', [0.85 0.325 0.089])
end	

