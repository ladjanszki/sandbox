import numpy as np
from sklearn.datasets import make_spd_matrix 


## Testing slicing and striding
#A = np.arange(35).reshape(5,7)
#
## Print MATRIX
#print(A)
#print('')
#
## Print 0th ROW
#print(A[0,:])
#print('')
#
## Print 0th COLUMN
#print(A[:,0])
#print('')
#
## Print SUBMATRIX
#print(A[1::,1::])
#print('')
#
## Print SUBMATRIX
#col = A[1::,0]
#print(A[1::,0])
#print('')
#
#B = A
#B[1::,0] = col * 2
#print(B)

def cholesky(A, L):
    L[0,0] = np.sqrt(A[0,0])

    if A.shape[0] > 1:
        col = A[1::,0] / np.sqrt(A[0,0])
        L[1::,0] = col

        A[1::, 1::] = A[1::, 1::] - np.outer(col, col)

        cholesky(A[1::, 1::], L[1::, 1::])

    return L

    

# Size of matrix
n = 4

# Empty result mx
L = np.zeros((n, n))
A = make_spd_matrix(n, random_state=1023234 )
#A = np.array([[1,0], [0,1]])
print(A)

L = cholesky(np.copy(A), L)




#print(A)
#print('')
#print('')
#
## Cholesky decomposition
#for i in range(n):
#
#    print('i:',i)
#
#    pivot = np.sqrt(A[i,i])
#    L[i,i] = pivot
#  
#    print(pivot**2)
#
#    if i < n - 1:
#        print('In if')
#        col = A[i+1::,i]
#
#        print(col)
#        col = col / pivot
#        L[i+1::,i] = col
#
#        print(L)
#        print('')
#
#        
#        subtract = np.outer(col, col)
#        A[i+1::, i+1::] = A[i+1::, i+1::] - subtract
#
#        print(A)

    

print('')
print('')
print(A)
print('')
print('')
print(L)
print('')
print('')
#print(A - np.matmul(L, np.transpose(L)))
print(np.linalg.cholesky(A))





