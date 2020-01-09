#integer

x = 2L                # o L serve pra forçar que o tipo da variável seja integer
typeof(x)              # se tirar o L ela vira double

#double

y = 2.5
typeof(y)

# complex
z = 3 + 2i
typeof(z)


#character

a = 'hello world'
typeof(a)


g = 'Hello'
n = 'bob'
msg = paste(g, n)   #concatenar duas strings
msg




######  logical 

q1 = T
typeof(q1)


# == 
# <=
# >=
# !=  diferente
# &
# |  ou
# !  não
# isTrue()


res = !T
res2 = 3 < 2

res | res2
res & res2 

isTRUE(res)


































