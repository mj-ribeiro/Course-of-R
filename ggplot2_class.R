v1 = c( 'car', 'mt', 'mt', 'car', 'mt')
price = c(100, 30, 60, 110, 90)

df = data.frame(v1, price)

df[v1=='mt', ]

mtdf = df$v1 == 'mt'

df[mtdf, ]