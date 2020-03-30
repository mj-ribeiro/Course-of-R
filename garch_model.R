#*********************************************************************************
#                               GARCH
#*********************************************************************************
setwd("D:/Git projects/R course")


# Libraries

library(tseries)
library(timeSeries)
library(forecast)   # auto.arima
library(quantmod)
library(fGarch)
library(mFilter)
library(GetBCBData)   # get Bacen data


# GET DATA


ibov = getSymbols('^BVSP', src='yahoo', from= '2007-01-01', auto.assign = F)[,4]
colnames(ibov)= c('ibov')


ibov = ibov[is.na(ibov)==F]
data = index(ibov)



#ib = as.vector(ibov) 
#ib = as.xts(ib, order.by = data)


#---------- Returns of ibov

ret = diff(log(ibov))
colnames(ret) = c('ret')
plot(ret)



#--------- Descriptive stats


basicStats(ibov)
basicStats(ret)



#------------ Plots

windows()
par(mfrow=c(3, 1))
plot(ibov, main='Evolution of IBOV')
plot(ret, main='Evolution of IBOV returns')
plot(ret^2, main='Evolution of square of IBOV returns')



#----------- Garch model

# Arch test


for (i in 1:5) {
  print(ArchTest(x = ret, lags = i))
}

ret = ret[is.na(ret)==F]  # Drop na to work


data = index(ret)
View(data)


# Estimation Garch (1, 1)


garch1 = garchFit(formula = ~garch(1,1),
                     data = ret)


summary(garch1)

vol = garch1@sigma.t
vol = as.xts(vol, order.by = data)



#---------- Predict 



windows()
par(mfrow=c(2, 2))
plot(ibov, main='Evolution of IBOV')
plot(ret, main='Evolution of IBOV returns')
plot(ret^2, main='Evolution of square of IBOV returns')
plot(vol, main= 'Volatility of IBOV returns by GARCH(1,1)')




#------------ Other library


library(rugarch)


spec = ugarchspec()
spec

#------- Model

ugarchfit(variance.model = )

spec1 = ugarchspec(variance.model=list(model="sGARCH", garchOrder=c(1,1)), 
                       mean.model=list(armaOrder=c(1,0), include.mean=TRUE),  
                       distribution.model="norm")


garch2 = ugarchfit(spec = spec1, data= ret)

garch2



#--------- Predict


pred2 = ugarchforecast(garch2, n.ahead = 5)
pred2 = pred2@forecast$sigmaFor

plot(pred2, type='l')










