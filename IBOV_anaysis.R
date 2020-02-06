
library(tseries)
library(timeSeries)
library(forecast)   # auto.arima
library(quantmod)
library(fGarch)
library(mFilter)


# SEE https://rpubs.com/kapage/523169

#---------- Get IBOV 


getSymbols("^BVSP", src="yahoo", from="2010-01-01")

dates = index(BVSP)


IBOV = BVSP[1:2505 , 4]
#rownames(IBOV)= dates
#View(IBOV)


plot(IBOV, type='l')

#------ STATS

basicStats(IBOV)

IBOV = na.omit(IBOV)  # Remove na's without change data format

#IBOV = ifelse(is.na(IBOV), mean(IBOV, na.rm=T ), IBOV)



# ---------------- OTHER FORM TO GET IBOV

n = length(IBOV) 



class(BVSP)

bvcore = index(dates)

bvcore = coredata(BVSP)
rownames(bvcore) =  dates
bvcore = data.frame(bvcore)

names(bvcore)[4] = "IBOV"             # RENAME ONLY COLUMN 4

bvcore <- bvcore[ ,4, drop=FALSE]     # KEEP ONLY IBOV


#--------------------- Returns

for (i in 1:n) {
    bvcore$ret[i+1] = log(bvcore[i+1, 1]/bvcore[i, 1])
}



plot(dates,bvcore[ , 2], type='l', 
     col='blue', ylab='Returns of IBOVESPA',
     main='Evolution of Ibovespa returns')


hist(bvcore[ , 2], col = 'lightblue', main = 'Histogram of IBOVESPA returns', probability = T)



shapiro.test(bvcore[ , 2]) #The null-hypothesis of this test is that the population is normally distributed. 

jarque.bera.test(na.omit(bvcore[ , 2]))


basicStats(bvcore[ , 2])  #stats


t.test(bvcore[ , 2], mu=0)  # test if mean of returns is equal zero








#-------------- GARCH



adf.test(na.omit(bvcore[ , 2]) ) # ADF TEST

# I will remove na's

bvcore[ , 2] = ifelse(is.na(bvcore[ , 2]), mean(bvcore[ , 2], na.rm=T ), bvcore[ , 2])
basicStats(bvcore[ , 2])



vol = garchFit(bvcore[ , 2] ~garch(1, 1), trace = FALSE)
summary(vol)

fit =  fitted(vol)

plot(fit, type='l', col='blue', ylab='Volatilidade', 
     main='IBOV returns volatility using GARCH(1,1)')


#----------- ARIMA
windows()
par(mfrow=c(1,2))
acf(bvcore[ , 2], main='Autocorrelation of IBOV returns')
pacf(bvcore[ , 2], main='Partial autocorrelation of IBOV returns')


ar = auto.arima(bvcore[ , 2], lambda = 'auto')

fit = forecast(ar, h=30)
plot(fit)



#-------------- HP Filter

filt = hpfilter(bvcore[ , 2], freq = 1600)
plot(filt)









