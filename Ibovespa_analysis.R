
library(tseries)
library(timeSeries)
library(forecast)   # auto.arima
library(quantmod)
library(fGarch)
library(mFilter)
library(ggplot2)

# SEE https://rpubs.com/kapage/523169

#---------- Get IBOV 


getSymbols("^BVSP", src="yahoo", from="2010-01-01")

dates = index(BVSP)


#-----------------


class(BVSP)

bvcore = index(dates)

bvcore = coredata(BVSP)
rownames(bvcore) =  dates
bvcore = data.frame(bvcore)

names(bvcore)[4] = "IBOV"             # RENAME ONLY COLUMN 4

bvcore <- bvcore[ ,4, drop=FALSE]     # KEEP ONLY IBOV


n = length(bvcore$IBOV) 



#-----------------returns

for (i in 1:n) {
  bvcore$ret[i+1] = log(bvcore[i+1, 1]/bvcore[i, 1])
}


bvcore = na.omit(bvcore)


hist(bvcore$ret, col='lightblue')




g1 = ggplot(data=bvcore, aes(x = ret))

g1 + geom_histogram(fill='white', colour='black', bins = 50)



#---------------- tax revenue

library(readxl)
df = read_excel(file.choose())



tax = reshape(data = df,
             idvar= c('Country Code','Country Name'),
             varying = 3:41,
             sep= "",
             timevar= "year",
             times =seq(1980, 2018, 1),
             new.row.names= 1:10296,
             direction = "long")


tax = tax[order(tax$`Country Name`), ]

attach(tax)

filt1 = tax$year>=1990 & (tax$`Country Code`== 'CHN' | tax$`Country Code`== 'BRA' | tax$`Country Code`== 'ZAF' | tax$`Country Code`== 'IND' | tax$`Country Code`== 'RUS') 
 

data = tax[filt1,  ]


library(foreign)

coplot(tax ~ year|`Country Code`, type="l", data=data) # Lines

library(car)
windows()
scatterplot(tax ~ year|`Country Code`, boxplots=FALSE, smooth=T, reg.line=FALSE, data=data)



plot(factor(data$`Country Code`), data$tax)


v = ggplot(data=data, aes(x=year, y=tax))
windows()
  
  v + 
  geom_line(binwidth=10,colour='black') +
  facet_grid(factor(data$`Country Code`))



tapply(data$tax, data$`Country Code`, summary)
  

par(mfrow=c(2, 3))
tapply(data$tax, data$`Country Code`, 
       plot)



plot(data$tax, data$year)



f2 = data$`Country Code`== 'BRA'


bra = data[f2, 'tax']

ano = data[f2, 'year']



plot(ano$year,  bra$tax , 
     type = 'l',
     xlab = 'Year',
     ylab = 'Tax revenue')









  
                
                
                
                
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  