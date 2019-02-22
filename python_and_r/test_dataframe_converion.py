import rpy2.robjects as robjects
import rpy2.robjects.packages as rpackages
from rpy2.robjects import pandas2ri
from rpy2.robjects.vectors import StrVector
import pandas as pd


# Tuple of packages to install in R
packageNames = ('afex', 'emmeans')

# Get the utility to import R packages into the remote process
utils = rpackages.importr('utils')
utils.chooseCRANmirror(ind=1)
 
# Get the name of the packages to install
packnames_to_install = [x for x in packageNames if not rpackages.isinstalled(x)]
print(packnames_to_install)
 
# Install packages into the R session if required
if len(packnames_to_install) > 0:
    print("installing packages")
    utils.install_packages(StrVector(packnames_to_install))
else:
    print("no packages have to be installed")



# Get the data
data = robjects.r('read.table(file = "http://personality-project.org/r/datasets/R.appendix3.data", header = T)')
#print(type(data))
#print(data)

# Converting rpy.robjects.vectors.DataFrame to pandas.DataFrame
df = pandas2ri.ri2py(data)

print(df.head())
print(type(df))

# This activation here is needed for the pandas2ri.py2ri call
# If this is invoked at the beginning the code does not work
# TODO: RTFM
pandas2ri.activate()

# Converting pandas.DataFrame to rpy.robjects.vectors.DataFrame 
r_df = pandas2ri.py2ri(df)
print(type(r_df))
print(r_df)

# Importing the afex package to do ANOVA testing
afex = rpackages.importr('afex') 
model = afex.aov_ez('Subject', 'Recall', data, within='Valence')
print(model)
print(type(model))



