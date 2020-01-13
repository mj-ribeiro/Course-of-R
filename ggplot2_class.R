setwd("D:/Git projects/R course")

### update R

#install.packages("installr")   # Library
library (installr)
updateR()

library(ggplot2)


df = read.csv('movierating.csv')

head(df)
tail(df)

## renaming columns

colnames(df)[2] = 'genre'
colnames(df)[3] = 'rotten tomatoes'
colnames(df)[4] = 'audience rating'
colnames(df)[5] =  'budget'
colnames(df)[6] =  'year'

attach(df)


table(genre)


##### factor

df$year = factor(year)

summary(df)


basicStats(df$`rotten tomatoes`)



###### ----------------------------- Graphs

head(df)

## scatter plot by genre

ggplot(data = df, aes(x = `rotten tomatoes`, y= `audience rating`, colour=genre)) + geom_point()
  

## size by budget

windows()
ggplot(data = df, aes(x = `rotten tomatoes`, y= `audience rating`, 
                      colour=genre, size=budget, 
                      alpha=0.5)) + geom_point()


### graph with object


p = ggplot(data = df, aes(x = `rotten tomatoes`, y= `audience rating`, 
                          colour=genre, size=budget, 
                          alpha=0.5)) 


p + geom_point()

p + geom_line()


###linear scatter plot

ggplot(data = df, aes(x = `rotten tomatoes`, y= `audience rating`
                      )) + geom_point(colour='blue') +
                        geom_smooth(method = "lm", se = FALSE)





q = ggplot(data = df, aes(x = `rotten tomatoes`, y= `audience rating`, 
                      colour=genre, size=budget 
                      )) 

## subscripting graphs  

windows()

# 1
q + geom_point(aes(size=`audience rating`))

# 2
q + geom_point(aes(colour=`budget`))

# 3

q + geom_point(aes(x=budget)) + xlab('budget')


# 4

q + geom_line(size=1) + geom_point()


#### Mapping vs setting

r = ggplot(data = df, aes(x=`rotten tomatoes`, y= `audience rating`))

## mapping
r + geom_point(aes(colour=genre))


## setting
r + geom_point(colour='blue', size=1)



##--------------------------- Histogram

t = ggplot(data = df, aes(x=`budget`))

t + geom_histogram(binwidth = 10, aes(fill=genre), colour='black')


t = ggplot(data=df, aes(x=`audience rating`))
t + geom_histogram(binwidth = 10, fill='white', position = 'stack', colour='blue')


##---------------------------- Density plot

t + geom_density(aes(fill=genre), position = 'stack')






##------------------------ smooth function

u = ggplot(data = df, aes(x=`rotten tomatoes`, y=`audience rating`, colour=genre))

u + geom_point() + geom_smooth(fill=NA, method = 'lm')


##---------------------------- boxplot


u = ggplot(data = df, aes(x=`rotten tomatoes`, y=`audience rating`, colour=genre))
u + geom_boxplot(size=1.2)

f1 = factor(genre)

# I will rename variables to get easier

colnames(df)[3] = 'rottom'
colnames(df)[4] = 'audirat'


by(df$audirat,f1, summary )

by(df$rottom,f1, summary )

u = ggplot(data = df, aes(x=genre, y=audirat, colour=genre))

u + geom_boxplot(size=1) + geom_point()



###----------------------------- using facets

## create a hist for each movie genre 

v = ggplot(data=df, aes(x=budget))
windows()
v + geom_histogram(binwidth=10, aes(fill=genre), colour='black') + facet_grid(genre)

#  scale free for each movie genre 

v + geom_histogram(binwidth=10, aes(fill=genre), 
          colour='black') + facet_grid(genre, scales = 'free') + xlab('orçamento (em milhões de dólares)')


## create a scatter plot for each movie genre 


k = ggplot(data=df, aes(x=audirat, y=rottom, colour=genre))

k + geom_point(size=3) + facet_grid(.~genre, scales = 'free')
k + geom_point(size=3) + facet_grid(genre, scales = 'free')

# facets for each year

windows()
k + geom_point(size=3) + facet_grid(.~year, scales = 'free')



# facets for each year and  genre
windows()
k + geom_point(size=3) + facet_grid(genre~year, scales = 'free')

windows()
k + geom_point(aes(size=budget)) + facet_grid(genre~year, scales = 'free')


#-------------------------- LIMITS AND ZOOM

p = ggplot(data = df, aes(x=audirat, y=rottom, 
                          size=budget, colour=genre))

windows()
p + geom_point() + xlim(50, 100) + ylim(50,100) # take points between 50 and 100




#------------------------ THEMES


s = k + geom_point(size=3) + facet_grid(.~year, scales = 'free')

windows()
s + xlab('crítica da audiência') +
  ylab('Rottem tomatoes') +
  theme(axis.title.x = element_text(colour = 'blue', size=30),
        axis.title.y = element_text(colour = 'green', size=30),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=20),
        legend.text = element_text(size=15),
        legend.position = c(1,1),
        legend.justification = c(1,1))




