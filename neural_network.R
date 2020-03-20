#***************************************************************************
#                          Neural Network
#****************************************************************************

e1 = c(0, 0) 
e2 = c(0, 1) 
e3 = c(1, 0) 
e4 = c(1, 1) 

ent = rbind(e1, e2, e3, e4)

pes = c(0, 0)

s = c(0 , 0, 0, 1)


apr = 0.1



# step function


step = function(soma){
  if (soma>=1) {
      return(1)
}else{
     return(0)
}
}



# sum function



sum = function(rg){
  s1 = rg%*%pes
  return(step(s1))
    
}

step(ent[4]%*%pes[4])



#### Neural network



neural = function(){
  e_t = 1
  while(e_t !=0){
    e_t = 0
    for (i in 1:length(s)){
      s_cal = step(ent[i, ]%*%pes)
      
      
      e = abs(s[i] - s_cal)
      e_t = e_t + e
      
      
      for (j in 1:length(pes)) {
        pes[j] = pes[j] + apr * ent[i, j] * e
        
      }
    }
  }

  cat('Os pesos são:', pes)

  }




neural()





