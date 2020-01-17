setwd("D:/Git projects/R course")

library(ggplot2)
library(haven)


df <- read_dta("D:/DOUTORADO/Others/painel felicidade/Estatística.dta")

attach(df)

f1 = df[year>2010, ]
#f1 = na.omit(f1)

#--------------------------- GRAPHS


g1 = ggplot(data = f1, aes(x= hc, y=cresppc, 
          colour=rendacod, size=lld, 
          alpha=I(0.5)))+geom_point()


g2 = g1+facet_grid(.~year)+
  scale_color_gradientn(colours = rainbow(4))+
  labs(color='Classificação \nde renda', size='Cantril \nLadder', 
       x='Capital Humano', y= 'Taxa de crescimento do PIB per capita')+
  theme(axis.title.x= element_text(colour = 'black', size = 10),
       axis.title.y = element_text(colour = 'black', size =10) )

  
windows()
g2




f2 = df[CountryCode=='BRA', ]

View(f2)














