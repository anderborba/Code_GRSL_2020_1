% Coded by Anderson Borba data: 01/07/2020 version 1.0
% Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images 
% GRSL - IEEE Geoscience and Remote Sensing Letters 
% Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery
% 
% Description
% 1) Calculate metricas to Flevoland 
%  
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output 
% 1) Print this information in txt files
% Obs: 1) Prints commands are commented with %  
%      2) Contact email: anderborba@gmail.com
%      3) Change *.txt to Flevoland region II 
clear all;
format long;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ..
cd Data
ev_hh = load('evidence_flev_hh.txt');
ev_hv = load('evidence_flev_hv.txt');
ev_vv = load('evidence_flev_vv.txt');
xc = load('xc_flevoland.txt');
yc = load('yc_flevoland.txt');
cd ..
cd Code_matlab
num_radial = 25;
for i = 1: num_radial 
ev(i, 1) = round(ev_hh(i, 3));
ev(i, 2) = round(ev_hv(i, 3));
ev(i, 3) = round(ev_vv(i, 3));
end
nc = 3;
m = 750;
n = 1024;
for i = 1: nc
	IM = zeros(m, n, nc);
end
for canal = 1 : nc
	for i = 1: num_radial
        		ik =  ev(i, canal); 
			IM( yc(i, ik), xc(i, ik), canal) = 1;
	end
end
[IF1] = fus_media(IM, m, n, nc);
[IF2] = fus_pca(IM, m, n, nc);
[IF3] = fus_swt(IM, m, n, nc);
[IF4] = fus_dwt(IM, m, n, nc);
[IF5] = fus_roc(IM, m, n, nc);
[IF6] = fus_svd(IM, m, n, nc);
GT = zeros(m, n);
cd ..
cd Data
GT = load('gt_flevoland.txt');
cd ..
cd Code_matlab
r = 120;
erro_gt = 0;
nk = 10;
for j = 1: num_radial
	cont_f1 = 0;
	for i = 1: r
		if (yc(j, i) && xc(j, i)) > 0 
			if  GT(yc(j, i), xc(j, i)) > 0
				erro_gt = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
			if  IF1(yc(j, i), xc(j, i)) > 0
				cont_f1 = cont_f1 + 1;
				erro_aux_f1(cont_f1) = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
		end
	        minimo_f1 = 100; 
		for c=1: cont_f1
 			d = abs(erro_aux_f1(c) - erro_gt);
			minimo_f1 = min(d, minimo_f1);
		end
	end
	erro_f1(j) = minimo_f1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	cont_f2 = 0;
	for i = 1: r
		if (yc(j, i) && xc(j, i)) > 0 
			if  GT(yc(j, i), xc(j, i)) > 0
				erro_gt = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
			if  IF2(yc(j, i), xc(j, i)) > 0
				cont_f2 = cont_f2 + 1;
				erro_aux_f2(cont_f2) = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
		end
	        minimo_f2 = 100; 
		for c=1: cont_f2
 			d = abs(erro_aux_f2(c) - erro_gt);
			minimo_f2 = min(d, minimo_f2);
		end
	end
	erro_f2(j) = minimo_f2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	cont_f3 = 0;
	for i = 1: r
		if (yc(j, i) && xc(j, i)) > 0 
			if  GT(yc(j, i), xc(j, i)) > 0
				erro_gt = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
			if  IF3(yc(j, i), xc(j, i)) > 0
				cont_f3 = cont_f3 + 1;
				erro_aux_f3(cont_f3) = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
		end
	        minimo_f3 = 100; 
		for c=1: cont_f3
 			d = abs(erro_aux_f3(c) - erro_gt);
			minimo_f3 = min(d, minimo_f3);
		end
	end
	erro_f3(j) = minimo_f3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	cont_f4 = 0;
	for i = 1: r
		if (yc(j, i) && xc(j, i)) > 0 
			if  GT(yc(j, i), xc(j, i)) > 0
				erro_gt = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
			if  IF4(yc(j, i), xc(j, i)) > 0
				cont_f4 = cont_f4 + 1;
				erro_aux_f4(cont_f4) = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
		end
	        minimo_f4 = 100; 
		for c=1: cont_f4
 			d = abs(erro_aux_f4(c) - erro_gt);
			minimo_f4 = min(d, minimo_f4);
		end
	end
	erro_f4(j) = minimo_f4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	cont_f5 = 0;
	for i = 1: r
		if (yc(j, i) && xc(j, i)) > 0 
			if  GT(yc(j, i), xc(j, i)) > 0
				erro_gt = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
			if  IF5(yc(j, i), xc(j, i)) > 0
				cont_f5 = cont_f5 + 1;
				erro_aux_f5(cont_f5) = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
		end
	        minimo_f5 = 100; 
		for c=1: cont_f5
 			d = abs(erro_aux_f5(c) - erro_gt);
			minimo_f5 = min(d, minimo_f5);
		end
	end
	erro_f5(j) = minimo_f5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	cont_f6 = 0;
	for i = 1: r
		if (yc(j, i) && xc(j, i)) > 0 
			if  GT(yc(j, i), xc(j, i)) > 0
				erro_gt = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
			if  IF6(yc(j, i), xc(j, i)) > 0
				cont_f6= cont_f6 + 1;
				erro_aux_f6(cont_f6) = sqrt(yc(j, i)^2 + xc(j, i)^2);
			end
		end
	        minimo_f6 = 100; 
		for c=1: cont_f6
 			d = abs(erro_aux_f6(c) - erro_gt);
			minimo_f6 = min(d, minimo_f6);
		end
	end
	erro_f6(j) = minimo_f6;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nk = 10;
freq_f1 = zeros(1, nk + 1); 
freq_f2 = zeros(1, nk + 1); 
freq_f3 = zeros(1, nk + 1); 
freq_f4 = zeros(1, nk + 1); 
freq_f5 = zeros(1, nk + 1); 
freq_f6 = zeros(1, nk + 1); 
for k= 1: nk
	contador_f1 = 0;
	for j = 1: num_radial
		if (erro_f1(j) < k)
			contador_f1 = contador_f1 + 1;
		end
	end
	freq_f1(k + 1) = contador_f1 / num_radial;
	contador_f2 = 0;
	for j = 1: num_radial
		if (erro_f2(j) < k)
			contador_f2 = contador_f2 + 1;
		end
	end
	freq_f2(k + 1) = contador_f2 / num_radial;
	contador_f3 = 0;
	for j = 1: num_radial
		if (erro_f3(j) < k)
			contador_f3 = contador_f3 + 1;
		end
	end
	freq_f3(k + 1) = contador_f3 / num_radial;
	contador_f4 = 0;
	for j = 1: num_radial
		if (erro_f4(j) < k)
			contador_f4 = contador_f4 + 1;
		end
	end
	freq_f4(k + 1) = contador_f4 / num_radial;
	contador_f5 = 0;
	for j = 1: num_radial
		if (erro_f5(j) < k)
			contador_f5 = contador_f5 + 1;
		end
	end
	freq_f5(k + 1) = contador_f5 / num_radial;
	contador_f6 = 0;
	for j = 1: num_radial
		if (erro_f6(j) < k)
			contador_f6 = contador_f6 + 1;
		end
	end
	freq_f6(k + 1) = contador_f6 / num_radial;
end
cd ..
cd Data
       fname = sprintf('metricas_fusao_flevoland.txt', canal);
       fid = fopen(fname,'w');
       for i = 1: nk
                fprintf(fid,'%f ', freq_f1(i));
        end
	fprintf(fid,'\n');
      	for i = 1: nk
        	fprintf(fid,'%f ', freq_f2(i));
        end
	fprintf(fid,'\n');
       	for i = 1: nk
                fprintf(fid,'%f ', freq_f3(i));
        end
	fprintf(fid,'\n');
       	for i = 1: nk
                fprintf(fid,'%f ', freq_f4(i));
        end
	fprintf(fid,'\n');
       	for i = 1: nk
                fprintf(fid,'%f ', freq_f5(i));
        end
	fprintf(fid,'\n');
       	for i = 1: nk
                fprintf(fid,'%f ', freq_f6(i));
        end
	fprintf(fid,'\n');
        fclose(fid);       
cd ..
cd Code_matlab
