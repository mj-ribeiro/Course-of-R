
d = seq(1, 20, 1)

A = matrix(d, 4, 5)

A = matrix(d, 4, 5, byrow = TRUE)


vec = c('a', 'b', 'c')
t = rep(vec, each=3)

A1 = matrix(t, 3, 3)
A1





## rbind and cbind

v1 = c('learn', 'r', 'funny')
v2 = c('very', 'easy', 'now')
v3 = c('sometimes', 'very', 'hard')
v4 = c(1, 2, 3)

## Create matrix

B = rbind(v1, v2,v3,v4)       #or
B = cbind(v1, v2,v3,v4)


######### naming columns and rows

c1 = seq(1, 5,1)
c2 = rnorm(5)
c3 = seq(-44, -40, 1)

C = rbind(c1,c2,c3)

nr = c('j', 'k', 'l')
nc = c('l1', 'l2', 'l3', 'l4', 'l5')


colnames(C) = nc
rownames(C) = nr
C

## slice matrix by row and column names

C['j', 'l4']
C['k', 'l5']  #Or
C[1, 2]




############  OTHER EXAMPLE

d1 = c(12, 33)
d2 = rnorm(2)

dcn = c('c1', 'c2')
drn = c('l1', 'l2')

D = cbind(d1, d2)
colnames(D) = dcn
rownames(D) = drn

## Changing matrix D

D['l1', 'c1'] =10
D['l1', 'c2'] =120L
D


colnames(D) = NULL # Drop columns names
D













