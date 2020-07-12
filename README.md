GRSL-2020-1
The README shows how to use the codes made to perform the numerical tests of the article submitted for:
GRSL - IEEE Geoscience and Remote Sensing Letters
Fusion of Evidences in Intensities Channels for Edge Detection in PolSAR Images
Anderson A. de Borba, Maurı́cio Marengoni, and Alejandro C Frery

Test to Flevoland image
In Matlab/Octave
1) Run /Code_matlab/imagem_real_lin_radial_flev.m
      - Read data base /Data/AirSAR_Flevoland_Enxuto.mat
      - Write ray in: (There are 9 channels, but we use 3 to intensities)
              /Data/
              a) channel hh - flevoland_1.txt
              b) channel hv - flevoland_2.txt
              c) channel vv - flevoland_3.txt
      - Write ray coordinate in:
              /Data
             a) File xc_flevoland.txt
             b) File yc_flevoland.txt

In R
2) Run /Code_r/evidencias_im_real_sa_param_mu_L.R               
      - Read data base
              /Date    
              a) Channel hh - flevoland_1.txt
              b) Channel hv - flevoland_2.txt
              c) Channel vv - flevoland_3.txt
      - Write edge evidences       
               /Data
              a) Channel hh - evidence_flev_hh.txt
              b) Channel hv - evidence_flev_hv.txt
              c) Channel vv - evidence_flev_vv.txt

In Matlab/Octave
3) Run /Code_matlab/det_bordas_fusion_put_point_flev_r3.m
      - Read data base /Data/AirSAR_Flevoland_Enxuto.mat
      - Read edge evidences       
               /Data
              a) Channel hh - evidence_flev_hh.txt
              b) Channel hv - evidence_flev_hv.txt
              c) Channel vv - evidence_flev_vv.txt
      - Read ray coordinate in:
               /Data
               a) File xc_flevoland.txt
               b) File yc_flevoland.txt        
      - Show the fusion Images

4) Run /Code_matlab/gt_flevoland_r3.m
      - Read data base /Data/AirSAR_Flevoland_Enxuto.mat
      - Write ground truth /Data/gt_flevoland.txt

5) Run /Code_matlab/metricas_gt_flevoland.m
      -  Read edge evidences       
               /Data
              a) Channel hh - evidence_flev_hh.txt
              b) Channel hv - evidence_flev_hv.txt
              c) Channel vv - evidence_flev_vv.txt
     - Read ray coordinate in:
               /Data
              a) File xc_flevoland.txt
              b) File yc_flevoland.txt        
      - Read ground truth /Data/gt_flevoland.txt
      - Write probabilities error in /Data/metricas_fusao_flevoland.txt

In R
6) Run /Code_r/metricas_fusao_flev.r
      - Show probabilities error

Test to San Francisco Bay image
In Matlab/Octave
1) Run /Code_matlab/imagem_real_lin_radial_san_fran.m
      - Read data base /Data/SanFrancisco_Bay.mat
      - Write ray in: (There are 9 channels, but we use 3 to intensities)
            /Data/
            a) channel hh - san_fran_1.txt
            b) channel hv - san_fran_2.txt
            c) channel vv - san_fran_3.txt
      - Write ray coordinate in:
            /Data
            a) File xc_san_fran.txt
            b) File yc_san_fran.txt

In R
2) Run /Code_r/evidencias_im_real_sa_param_mu_L_san_fran.R               
      - Read data base
            /Date    
            a) Channel hh - san_fran_1.txt
            b) Channel hv - san_fran_2.txt
            c) Channel vv - san_fran_3.txt
      - Write edge evidences       
            /Data
            a) Channel hh - evidence_san_fran_hh.txt
            b) Channel hv - evidence_san_fran_hv.txt
            c) Channel vv - evidence_san_fran_vv.txt

In Matlab/Octave
3) Run /Code_matlab/det_bordas_fusion_put_point_san_fran_r1.m
      - Read data base /Data/SanFrancisco_Bay.mat
      - Read edge evidences       
            /Data
            a) Channel hh - evidence_san_fran_hh.txt
            b) Channel hv - evidence_san_fran_hv.txt
            c) Channel vv - evidence_san_fran_vv.txt
      - Write ray coordinate in:
            /Data
            a) File xc_san_fran.txt
            b) File yc_san_fran.txt
      - Show the fusion Images

4) Run /Code_matlab/gt_san_fran_r1.m
      - Read data base /Data/SanFrancisco_Bay.mat
      - Write ground truth /Data/gt_san_fran.txt

5) Run /Code_matlab/metricas_gt_sf.m
      -  Read edge evidences       
             /Data
            a) Channel hh - evidence_san_fran_hh.txt
            b) Channel hv - evidence_san_fran_hv.txt
            c) Channel vv - evidence_san_fran_vv.txt
      - Read ray coordinate in:
             /Data
            a) File xc_san_fran.txt
            b) File yc_san_fran.txt            
      - Read ground truth /Data/gt_san_fran.txt
      - Write probabilities error in /Data/metricas_fusao_san_fran.txt

In R
6) Run /Code_r/metricas_fusao_sf_r1.r
      - Show probabilities error
