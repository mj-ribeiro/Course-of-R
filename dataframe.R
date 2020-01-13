setwd("D:/Git projects/R course")


df = read.csv(file.choose())

df = read.csv('demog.csv') #other form to import dataset in diretory


df$nv = 0


attach(df)




################# caracteristics of data frame

typeof(df)
is.data.frame(df)

head(df)   # show first six elements
head(df, n=10)

tail(df)    #  show last six elements



nrow(df)  # rows number
ncol(df)  # columns number



summary(df)
str(df)


table(df$Income.Group)


##########  Slicing


head(df, n=10)

df[1:10, 1:5]   

df[1:3, 'Birth.rate']

df[1:3, 'Country.Code']

df[ c(1, 12, 25, 100), ]

df$Birth.rate[10]

######## operations with data frames

df$new = df$Birth.rate * df$Internet.users
df$new = NULL  # Drop new variable




# FILTERING Data frames


for (i in 1: n) {
  if (Birth.rate[i] > 20 ){
    print(Country.Name[i], max.levels=0, sep='\n')
  }
}


filter = Birth.rate < 20

df[ filter, ]    # show all countries with  Birth.rate < 20






#### categorizing variables by income

n = nrow(df)

for (c in 1:n) {
  if(Income.Group[c] == 'High income'){
    df$nv[c] = 1
  }else if(Income.Group[c] == 'Low income'){
    df$nv[c] = 4
  }else if (Income.Group[c] == 'Upper middle income'){
    df$nv[c] = 2
  }else if (Income.Group[c] == 'Lower middle income'){
    df$nv[c] = 3
  }
}





filter2 = df$nv == 1

df[ filter2, ]   # countries with nv == 1


filter3 = df$nv == 4 


df[ filter3, ]    # countries with nv == 1


df[ filter3 & Birth.rate <30,  ]    # two filters 




df[ Country.Code== 'BRA',  ]             # Take Brazil

df[ Country.Code== 'BRA', "Birth.rate" ]



############ plots
library(ggplot2)

qplot(data=df, x=Internet.users)
qplot(data=df, x=Income.Group, y=Birth.rate, size=I(3), colour=I("blue"))

qplot(data=df, x=Income.Group, y=Birth.rate, geom = "boxplot")   # boxplot



###### factors 

factor =factor(Income.Group)

by(Birth.rate, factor, summary)



### graphs by income group

windows()

par(mfrow=c(2, 2))

for (c in 1:4){
  plot(Internet.users[df$nv==c], Birth.rate[df$nv==c])
}




windows()
qplot(data=df, x=Internet.users, y=Birth.rate, size=I(3), colour=Income.Group, asp=2/3  ,xlab = 'Usuários de internet', ylab = 'Taxa de natalidade') ##other form
?qplot


      
      
      















