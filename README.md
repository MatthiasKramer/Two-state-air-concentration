# Two-state-air-concentration
This repository provides data and code for the two-state air concentration convolution presented in [Kramer and Valero](https://doi.org/10.1017/jfm.2023.440) (2023, JFM). The convolution principle is exemplified based on seminal data of [Straub and Anderson](https://doi.org/10.1061/JYCEAJ.0000261) (1958)

**Run the code**

To run the code, download the complete folder and execute TWOSTATEv10.mat. 

**Free parameters**

The two-state convolution contains several free parameters that may have to be adjusted for other datasets:

-L44: ystar is evaluated based on Fig. 4d in [Kramer and Valero](https://doi.org/10.1017/jfm.2023.440 (2023); note that this might not be a unique solution and ystar might have to be adjusted.

-L48: delta is computed empirically, as per Fig. 4c in [Kramer and Valero](https://doi.org/10.1017/jfm.2023.440 (2023). Please estimate delta from velocity measurements, if available.

-L55: overlap determines the number of points used for fitting. This will only slightly change results, but may be worthwhile to adjust.

-L62: sigmastar is determined as (0.1 to 0.2)*delta.


**Dataset on self-aerated flows (Straub and Anderson 1958)**

This dataset was digitized from the research paper by Straub and Anderson published in 1958. The data input was done manually, and all credits for the original data go to Straub and Anderson.

For citation purposes, please refer to the original paper:

STRAUB, L. & ANDERSON, A.G. 1958 Experiments on self-aerated flow in open channels. J. Hydraul. Div. 84 (7), 1–35.

**Disclaimer**

We hold no copyright over this data. All copyright and other rights of the data belong to the respective owners, authors, publishers, or other legal holders of the rights. This data is shared under the understanding of 'fair use' for non-commercial research and educational purposes. For other uses, please refer to and respect the original sources' policies and rights.

**Contact Information**

If you find any errors or discrepancies in this data, please feel free to open an issue or contact me directly.
