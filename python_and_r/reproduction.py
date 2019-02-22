# This code is reproduced from
# https://sites.google.com/site/aslugsguidetopython/data-analysis/pandas/calling-r-from-python

#from rpy2.robjects.packages import importr
from rpy2 import robjects
from rpy2.robjects import r as R
from rpy2.robjects import pandas2ri
import pandas as pd

R('x = c()')
R('x[1] = 22')
R('x[2] = 44')
ret = R('x')

print(ret)
print(type(ret))

# Assigning a value from python
robjects.globalenv['a_number'] = 8
print(R('ls()'))

# Playing with the mcar dataset
R('data(mtcars)')
data = R('mtcars')

# Checking what is in the working environment
print(R('ls()'))

# Getting mtcars back to a pandas DataFrame
df = pandas2ri.ri2py(data)
print(type(df))
print(df.head())

# Manipulating the mtcars at Python side
df['wt'] = 2
print(df.head())

# Print out the original dataframe from R
print(R('mtcars'))

# Putting the modified dataframe back to R
pandas2ri.activate()

# Converting pandas.DataFrame to rpy.robjects.vectors.DataFrame 
r_df = pandas2ri.py2ri(df)
print(type(r_df))
print(r_df)
 
# Assigning the modified dataframe into a name in the R global environment
robjects.globalenv['mtcars'] = r_df

# Checking what is in the working environment
print(R('ls()'))

print(R('mtcars'))

 
