#---------------------------------------------------------------------------------------
#                             Operador Pipe
#---------------------------------------------------------------------------------------

setwd("D:/Git projects/R course")


library(magrittr)

# basic operations

x = rnorm(100)
x %>% sum %>% sqrt 


xpos = x[x>0]
med = xpos %>% mean


# plot

x%>% plot(type='l')



p = function(z){
  return(plot(z, type='l'))
}


x %>% p




#----------- moments


library(moments)

mom = function(z){
  skewness = z %>% skewness
  kurtosis = z %>% kurtosis
  mean = z %>% mean
  sd = z %>% sd
  res = data.frame(skewness, kurtosis, mean, sd)
  return(res)
}


moments = x %>% mom

moments = moments %>% round(5)

cat('\033[1;031m')
knitr:: kable(moments)


#------- Fit distribution
# obviously x is normaly distribution. But i test this.

library(fitdistrplus)

plotdist(as.vector(x), histo = T, demp = T)

as.vector(x) %>% descdist(boot = 1000)

fit <- as.vector(x) %>% fitdist('norm')

fit %>% summary

fit %>% plot 


#---------  Fit distribution of IBOV returns

library(quantmod)
library(fGarch)

ibov = getSymbols('^BVSP', src='yahoo', 
                  from= '1995-01-01', 
                  periodicity = "monthly",    # IBOV mensal
                  auto.assign = F)[,4]


ret = ret %>% as.vector

ret = ibov %>% log %>% diff  


ret %>% basicStats


ret = ret %>% na.omit


ret %>% as.vector %>% descdist 

ret %>% hist(breaks=35, col = 'lightblue', probability = T)


#---- Using propagate library



library(propagate)

fit <- as.vector(ret) %>% fitDistr
fit %>% summary

df = data.frame(fit$stat$Distribution, fit$stat$BIC)

df[which.min(df$fit.stat.BIC), ]   # best dist

fit$par$Logistic               # parameters



loc = fit$par$Logistic[1] 
sc = fit$par$Logistic[2] 


lg = function(x){
  l = (exp(-(x-loc)/sc))/(sc*(1 + exp(-(x-loc)/sc))^2)
  return(l)
}


plot(ret, ret %>% lg)



cumul = function(k, z){
  w = seq(k, z, 0.01)
  c = 0
  for(i in w){
    c = c + lg(i)/100
}
  return(c)
}

cumul(-0.6, -0.1231)

quantile(ret, 0.05)


ks.test(ret, 'plogis')




#------ simulations

library(sn)

e_s = c()
for (i in 1:1000) {
  x = rsn(10000, alpha = 0.5)
  var = x %>% quantile(0.05)
  es = x[x<var] %>% mean
  e_s[i] = es 
}

e_s %>% hist(col='lightgreen')













