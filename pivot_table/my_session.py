# coding: utf-8

import itertools
import pandas as pd
import numpy as np

# Lists with the hyperparameters
lookback = [1, 2, 3, 6, 9]
holding = [1, 2, 3, 4] 

# Outer product of hyperparameters
x = list(itertools.product(lookback, holding))

# Unpack to lists
l = []
h = []
for i in x:
    l.append(i[0])
    h.append(i[1])
 
# Build a dataframe 
tmp = pd.DataFrame(columns=['lookback', 'holding', 'sharpe', 'return', 't-stat'])
   
tmp['lookback'] = np.asarray(l)
tmp['holding'] = np.asarray(h)

tmp['sharpe'] = np.random.rand(tmp.shape[0])
tmp['return'] = np.random.rand(tmp.shape[0]) * 7
tmp['t-stat'] = np.random.rand(tmp.shape[0]) * 3

# Create pivot table for every hyperparameter pair
pd.pivot_table(tmp, index = 'lookback', columns='holding', values='return')

