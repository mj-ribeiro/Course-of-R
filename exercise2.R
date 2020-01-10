#Data

revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)


profit = revenue-expenses

n = length(profit)


profitliq = rep(0, n)


for (i in 1:n){
  if (profit[i]>0){
    profitliq[i] = profit[i] - profit[i]*0.3 
  }else{
    profitliq[i] = profit[i]
  }
}


profit == profitliq


profitmarg = profitliq/revenue


mean = mean(profitliq)


for (i in 1:n){
  if (profitliq[i] > mean){
    cat('Profit biggest than average in month:', i, sep = '\n')
    }else {
      cat('Profit smallest than average in month:', i, sep = '\n')
    }
}




which(profitliq %in% max(profitliq))        #bigger profit # which function identifies all elements
which(profitliq %in% min(profitliq))        #smaller profit # which function identifies all elements





