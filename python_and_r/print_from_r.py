from rpy2.robjects import r as R

# Testing some simple R code
ret = R('''
print("from R")
''')

# The return object
print('return value')
print(type(ret))
print(ret)


