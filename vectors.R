setwd("D:/Curso de R")

vec = c(2, 22, 34, 0, 67,3, 4, 6, 7, 80)
vec[1:5]

is.numeric(vec)
is.integer(vec)
is.character(vec)
is.double(vec)

typeof(vec)

vec1 = c('b', 'nn', 'k')

is.character(vec1)

vec2 = c(3, 'b', 'nn', 'k')

typeof(vec2)


##### Function seq

seq(1,10) # 1 a 10
seq(1,10, 2)  # from 1 to 10 jumping from 2 to 2
seq(10,1, -2) # from 10 to 1 jumping from 2 to 2


######## Function rep

rep(10, 5) # repeat 10 five times
rep('Marcos J Ribeiro', 10)

x = rnorm(4)
rep(x, 5)


#### SLICING VECTORS


vec[-2] #return the vector without the second element
vec[1:3] # return from first to third element of vector
vec[c(1, 3, 5)] #return the values in position 1, 3 and 5
vec[c(-1, -3, -5)] #return vec without values in position 1, 3 and 5
vec[-2:-4] #return vec without values in positin in range (2:4)



####### OPERATIONS WITH VECTORS

x = c(1, 5, 6, 7, 8)
y = c(33, 4, 41, 7, 11)

x+y
x/y
x*y
x-y
x>y
x|y
x != y
x == y

z = c(11, 2)
z+y       # sum two vector with diferent length, but, show warning


### SHOW ELEMENTS OF VECTORS

x = rnorm(10)


for (i in x[x>1]){
  print(i)
}



for (i in 1:10){
  print(x[i])
}



n = 100
a = rnorm(n)
b = rnorm(n)

c = a*b

d = rep(NA, n)

## multiplication of vector in conventional form

for (i in 1:n){
  d[i] = a[i]*b[i]
}

# compare c and d
d == c


?print  # help in R


seq(1, 10, length.out=200) # 200 numbers between 1 and 10




















