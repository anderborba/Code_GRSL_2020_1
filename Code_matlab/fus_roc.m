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

function [F] = fus_roc(E, m, n, nc)
V(1: m, 1: n)  = 0.0;
M(1: m, 1: n, 1: nc) = 0.0;
for i = 1: nc
	V(:, :) = V(:, :) + E(:, :, i);
end
for i= 1: m
	for j= 1: n
		if( V(i,j) >= 1 & V(i, j) <= nc)
			M(i, j, 1) = 1;
		end
		if( V(i,j) >= 2 & V(i, j) <= nc)
	        	M(i, j, 2) = 1;
		end
		if( V(i,j) >= 3 & V(i, j) <= nc)
			M(i, j, 3) = 1;
		end
	end
end
dim = m * n * nc;
%   Tp1 com M1E
for l  = 1: nc
	soma(1: nc) = 0.0;
	for k  = 1: nc
		for i= 1: m
			for j= 1: n
				if( M(i, j, l) > 0 & E(i, j, k) > 0 )
					soma(k) = soma(k) + 1;
				end
			end
		end
	end
	tp(l) = sum(soma)/ dim;
end
%   Fp1 com M1E
for l  = 1: nc
	soma(1: nc) = 0.0;
	for k  = 1: nc
		for i= 1: m
			for j= 1: n
				if( M(i, j, l) > 0 & E(i, j, k) == 0 )
					soma(k) = soma(k) + 1;
				end
			end
		end
	end
	fp(l) = sum(soma)/ dim;
end
%   TN1 com M1NE
for l  = 1: nc
	soma(1: nc) = 0.0;
	for k  = 1: nc
		for i= 1: m
			for j= 1: n
				if( M(i, j, l) == 0 & E(i, j, k) == 0 )
					soma(k) = soma(k) + 1;
				end
			end
		end
	end
	tn(l) = sum(soma)/ dim;
end
%   FN1 com M1NE
for l  = 1: nc
	soma(1: nc) = 0.0;
	for k  = 1: nc
		for i= 1: m
			for j= 1: n
				if( M(i, j, l) == 0 & E(i, j, k) > 0 )
					soma(k) = soma(k) + 1;
				end
			end
		end
	end
	fn(l) = sum(soma)/ dim;
end
F = M(:,:, 2);
