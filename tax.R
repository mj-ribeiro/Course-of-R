#####################################################################################################
#                                   
#                                      TAX ANALYSIS
#
######################################################################################################

#z = c(0, 12, 4, 5, 7)
#order(z)    # pega as posições dos itens na lista z em ordem crescente
#sort(z)     # ordena os elementos em ordem crescente 


setwd("D:/Git projects/R course")

library(readxl)
tax <- read_excel("D:/Git projects/R course/tax_revenue.xls")



####### reshape nos dados



tax = reshape(data = tax,
              idvar= "code",
              varying = 2:20,  # o reshape será feito a partir da coluna 2, pq a do code não conta
              v.names = 'tax',
              sep= " ",
              timevar= "year",
              times = seq(2000, 2018, 1),    # o período é de 2000 a 2018
              new.row.names= 1:10000,
              direction = "long")




tax = tax[ order(tax$code),  ]  # utilizar o order antes de fazer o próximo passo




#### criar data frame só com os brics


attach(tax)

filt1 = tax$year>=1990 & (tax$`code`== 'CHN' | tax$`code`== 'BRA' | tax$`code`== 'ZAF' | tax$`code`== 'IND' | tax$`code`== 'RUS') 


data = tax[filt1,  ]


#### análise descritiva


fator = factor(data$code)

by(data$tax, fator, summary)




####### Plots




library(foreign)

coplot(tax ~ year|`code`, type="l", data=data) # Lines



library(car)

windows()
par(mfrow=c(1,1))
plot(factor(data$`code`), data$tax, 
     ylab='Proporção entre carga tributária e PIB (2000 - 2018)',
     xlab= 'Países dos BRICS')




#### ggplot

library(ggplot2)

## facets

v = ggplot(data=data, aes(x=year, y=tax))

windows()
v + 
  geom_line(binwidth=10,colour='black') +
  facet_grid(factor(data$`code`))


## usando o tapply

tapply(data$tax, data$`code`, summary)


par(mfrow=c(2, 3))
tapply(data$tax, data$`code`, 
       plot)



#**************



f2 = data$`code`== 'BRA'


bra = data[f2, 'tax']

ano = data[f2, 'year']



par(mfrow=c(1,1))
plot(ano$year,  bra$tax , 
     type = 'l',
     xlab = 'Year',
     ylab = 'Tax revenue')


