# quickstart 🚀 

You have a great coding idea but are tired of manually setting up your Python data science environment? 

This minimalistic bash script automatically sets up your desired Python version and libraries, installs the Jupyter kernel such that you can start developing in your notebook after ~ 1 minute!  

I intentionally kept this process in an editable bash script for quick and easy customization. 


### Dependencies:  
This script depends on:  
- [pyenv](https://ggkbase-help.berkeley.edu/how-to/install-pyenv/) for installing Python, and  
- [poetry](https://python-poetry.org/docs/) for handling the Python environment and libraries.


### Usage:
Assuming you have both pyenv and poetry installed (and added to your path), you can use quickstart the following way:   

```$ source quickstart.sh MY_PROJECT 3.9.5 "pandas numpy matplotlib jupyter"```  

- `MY_PROJECT`: is your project's name, which name the project's directory and the jupyter kernel that will be installed. 
- `3.9.5`: is your desired Python version (handled with pyenv) 
- `"pandas numpy ..."`: here go your packages you want to have installed (handled with poetry). 

#### Package defaults:  

Note that quickstart assumes that you wish to jump into a Jupyter notebook. Therefore, if you overwrite the default packages, make sure to add jupyter. 

The default packages are: `"numpy pandas scikit-learn matplotlib jupyter"`.  
They are installed when running the following command without specifying packages:   

```$ source quickstart.sh MY_PROJECT 3.9.5```   


#### Disclosures  

This code is provided "as-is", and this repo does not claim to solve any problems that the underlying frameworks might have (e.g. trying to install scipy 1.6.1 with Python 3.10 versions). The goal is just to relieve you of the repeated effort to manually set up environments for new projects. 
 
