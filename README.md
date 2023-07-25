# Two-state air concentration
This repository provides data and code for the two-state air concentration convolution presented in [Kramer and Valero](https://doi.org/10.1017/jfm.2023.440) (2023, JFM). The convolution principle is exemplified based on seminal data of [Straub and Anderson](https://doi.org/10.1061/JYCEAJ.0000261) (1958).

<br />

**Run the code**

To run the code, download the complete folder and execute TWOSTATEv10.mat. 

<br />

**Free parameters**

The two-state convolution contains several free parameters that may have to be adjusted for other datasets:

- L44: the mean interface position **y<sub>*</sub>** is evaluated based on Fig. 4d in [Kramer and Valero](https://doi.org/10.1017/jfm.2023.440) (2023); note that this may not be a unique solution and **y<sub>*</sub>** can be adjusted.

- L48: the boundary layer thickness **δ** is computed empirically as per Fig. 4c in  [Kramer and Valero](https://doi.org/10.1017/jfm.2023.440) (2023), i.e., **δ/y<sub>*</sub>** ranges between 1.1 and 1.75. Please estimate **δ** from velocity measurements, if available.

- L55: the overlap determines the number of points away from **δ/2** and **y<sub>*</sub>** used for fitting. This will only slightly change results, but may be worthwhile to adjust.

- L62: the standard deviation of the interface position **σ<sub>*</sub>** is determined as (0.1 to 0.2)***δ**.

  <br />

**Dataset on self-aerated flows (Straub and Anderson 1958)**

The corresponding air concentration dataset within this repository was digitized from the research paper by [Straub and Anderson](https://doi.org/10.1061/JYCEAJ.0000261) published in 1958. The data input was done manually, and all credits for the original data go to Straub and Anderson.

For citation purposes, please refer to the original paper:

STRAUB, L. & ANDERSON, A.G. 1958 Experiments on self-aerated flow in open channels. J. Hydraul. Div. 84 (7), 1–35.

<br />

**Disclaimer**

We hold no copyright over the data from [Straub and Anderson](https://doi.org/10.1061/JYCEAJ.0000261) (1958). All copyright and other rights of this data belong to the respective owners, authors, publishers, or other legal holders of the rights. This data is shared under the understanding of 'fair use' for non-commercial research and educational purposes. For other uses, please refer to and respect the original sources' policies and rights.

<br />

**Contact Information**

If you find any errors or discrepancies in this code or data, please feel free to open an issue or contact me directly at m.kramer@adfa.edu.au.
