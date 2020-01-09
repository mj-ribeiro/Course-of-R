getwd()    # mostra o diretório atual
setwd("D:/Curso de R")   #muda para o diretório especificado entre parêntesis

mydata = read.csv(file.choose())     # abre o win explorer para eu escolher o arquivo

install.packages('ggplot2')

library(ggplot2)


windows()
ggplot(data=mydata[mydata$carat<2.5,], aes(x=carat, y=price, colour=clarity)) + geom_point(alpha=0.1)+ geom_smooth()