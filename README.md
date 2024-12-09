Data and code necessary to replicate the results in the paper "Dynamic cycling enhances battery lifetime".

The battery aging dataset is publicly available at https://purl.stanford.edu/td676xr4322
If you make use of this dataset, please cite:
Geslin, A., Xu, L., Ganapathi, D. et al. Dynamic cycling enhances battery lifetime. Nat Energy (2024). https://doi.org/10.1038/s41560-024-01675-8

I - System requirements
-----
All the analyses conducted to generate the results have been conducted either in Python or in Matlab. 
A- Python (version 3.8 or higher). All necessary python packages required to run the code in a new environment using Jupyter notebooks are specified in requirements.txt. All scripts have been tested on Mac OS Sonoma 14.5, with an Apple M1 Pro chip.
B- Matlab (R2024 version - on Windows 11). 
No non-standard hardware is required.


II - Installation (if new to Matlab and/or Python):
-----
A- Python is open source and can be downloaded from https://www.python.org/downloads/
A virtual environment can be set up with the required packages using the following command lines:

To create the environment named "test_env" using pip or venv
python3 -m venv test_env

To activate the environment:
[Windows] test_env\Scripts\activate
[macOS or Linux] source test_env/bin/activate

Install requirements
pip install -r requirements.txt

B- Matlab is a commercial software that can be downloaded at:
https://www.mathworks.com/help/install/
Packages required: Global Optimization Toolbox

While installation times may vary, Matlab and Python installation should be completed within 1h (within 20min most likely). 

III- Demos and Instructions
-----
To replicate the analyses performed in the paper, one can run the python ipynb scripts corresponding the the different analyses in the paper, except figure 4f-h which can be replicated by running the Matlab scripts in the figure 4 folder.
Python scripts should execute within a minute, except SHAP analysis runs that can take a few minutes. 
The Matlab script should execute within a minute, except the fitting part which could take up to 15min.

IV- Troubleshooting
-----
If during the import of xgboost package, an error "You are running 32-bit Python on a 64-bit OS" appears, try installing libomp.
