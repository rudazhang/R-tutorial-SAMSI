# set working directory
setwd("C:/Users/mmao/Google Drive/0_SAMSI/0_GDRR/Undergraduate_Workshop/gas")

# import data
df <- read.table("gas.txt")
df

# MLE
lambdas <- df$n / (df$s*6)
lambdas

overall_lambda <- sum(df$n) / sum(df$s*6)
overall_lambda

# 1 round of simulation
x <- c()
t <- 0
while(t < 10){
    tmp <- rexp(1, rate=sum(df$s)*overall_lambda)
    x <- c(x, tmp)
    t <- t + tmp
}
length(x)        # No. of failure
length(x)/(10*sum(df$s))     # lambda hat

# repeat the simulation 1000 times
n <- c()
lambda_hat <- c()
for(i in 1:1000){
    x <- c()
    t <- 0
    while(t < 10){
        tmp <- rexp(1, rate=sum(df$s)*overall_lambda)
        x <- c(x, tmp)
        t <- t + tmp
    }
    n <- c(n, length(x))
    lambda_hat <- c(lambda_hat, length(x)/(10*sum(df$s)))
}

par(mfrow=c(1,2))
hist(n)
hist(lambda_hat)

