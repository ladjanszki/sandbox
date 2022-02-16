import rpy2.robjects as ro
from rpy2.robjects import pandas2ri
from rpy2.robjects import r as R
import pandas as pd

# Activating R environment
pandas2ri.activate()
#R = ro.r



# Creating a test DataFrame
data = {'a' : [1, 2, 3, 4, 5, 6, 7, 8, 9],
        'b' : [11, 12, 13, 14, 15, 16, 17, 18, 19],
        'c' : [21, 22, 23, 24, 25, 26, 26, 28, 29]        
}
 
test = pd.DataFrame(data)

print(test.head())

M = R.lm('a ~ b', data=test)


print(R.summary(M).rx2('coefficients'))



