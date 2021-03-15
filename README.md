> **[Higher-order similarity between individual microstructural and functional brain network]()**

![](https://img.shields.io/badge/Language-matlab-brightgreen.svg?style=plastic) ![](https://img.shields.io/badge/Language-R-green.svg?style=plastic) ![](https://img.shields.io/badge/Date-14_Mar_2021-blue.svg?style=plastic)

**Functional data preprocessing**
- [x] Discard first 14 volumes
- [x] Realignment
- [x] Mean-based intensity normalization
- [x] Spatially normalize EPI (2×2×2 mm)
- [x] Linear detrending of retaining mean
- [x] Bandpass filtering between 0.043 and 0.087 Hz using the butter filter
- [x] Denoising：24HMP+8Phys+Spikereg
- [x] Participant exclusion

**Structural data preprocessing**

The T1-weighted and T2-weighted data were processed using the [MRTool](https://www.nitrc.org/projects/mrtool/) (version 1.4.2) implemented in the [SPM12](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/) (version 7771). The MRTool included bias correction and intensity calibration on each of the two images and the subsequent calculation of the ratio between preprocessed T1w and T2w images. Finally, we obtained the T1w/T2w ratio images in the MNI space with 1 × 1 × 1 mm resolution.

**Higher-order microstrucutral-function relationship**

We use the ORCA to count the 2-4 node graphlets
> Hočevar, T., & Demšar, J. (2014). A combinatorial approach to graphlet counting. *Bioinformatics*, *30*(4), 559-565.
You can visit this website for detailed instruction [Description — Orca (biolab.si)](https://file.biolab.si/biolab/supp/orca/orca.html)
---
Here, we only use the *11 non-redundant orbits* of 2- to 4-node graphlets (i.e. orbits 0, 1, 2, 4, 5, 6, 7, 8, 9, 10, 11). Notably, for the output file or matrix, the column index of 11 non-redundant orbits is *index = [1:3 5:12], i.e., [1 2 3 5 6 7 8 9 10 11 12]*;
> Yaveroğlu, Ö. N., Malod-Dognin, N., Davis, D., Levnajic, Z., Janjic, V., Karapandza, R., ... & Pržulj, N. (2014). Revealing the hidden language of complex networks. *Scientific reports*, *4*(1), 1-9. 

1、After you obtain each nodal 11 orbits' frequency within the network, then you can calculate the normalized frequency for each node by dividing its sum, to avoid the zero in the denominator, where we can add 1 to each of the normalized frequencies, and take the logarithm (10-base) of the normalized frequency.

2、For the normalized orbit frequency matrix (N × 11), N is the number of node within the network, we calculated the pairwise mutual information (MI) among all pairs of orbits and resulted in an 11-by-11 (Norbits × Norbits) MI matrix.

3、The Pearson correlation between their MI matrices is termed as the higher-order relationships of given networks.

See the `compare_two_graphs.m` line 7 - 34 for details
