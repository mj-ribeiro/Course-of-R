# -*- coding: utf-8 -*-
"""
Created on Sun Mar 22 10:14:20 2020

@author: Marcos J Ribeiro
"""

import rpy2.robjects as ro


ro.r('y=seq(1,20,1)')
ro.r('x=rnorm(20)')

ro.r('reg=lm(y~x)')

print(ro.r('summary(reg)') )



print(ro.r('plot(y,x)'))



print(ro.r('cor(x,y)'))

















