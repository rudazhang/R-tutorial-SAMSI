## Monte Carlo integration: Calculating $\pi$ ----------
## Need package plotrix
install.packages("plotrix")
library(plotrix)

plot(0.5, 0.5, type = "p", color = "black",
     xlim = c(0, 1), ylim = c(0, 1), asp = 1)
draw.circle(0.5, 0.5, 0.5, nv = 1000, border = NULL, col = NA, lty = 1, lwd = 1)
rect(0, 0, 1, 1)
plot(0.5, 0.5, type = "p", asp = 1, xlim = c(0, 1), ylim = c(0, 1), color = "black")
draw.circle(0.5, 0.5, 0.5, nv = 1000, border = NULL, col = NA, lty = 1, lwd = 1)
rect(0, 0, 1, 1)
plot.new()
plot(0.5, 0.5, type = "p", asp = 1, xlim = c(0, 1), ylim = c(0, 1), color = "black")
draw.circle(0.5, 0.5, 0.5, nv = 1000, border = NULL, col = NA, lty = 1, lwd = 1)
rect(0, 0, 1, 1)
mcpiwplot <- function(n) {
    m <- 0
    x <- runif(n)
    y <- runif(n)
    x1 <- x - 0.5
    y1 <- y - 0.5 #circle has center at (0.5,0.5)
    r2 <- x1^2 + y1^2
    for (i in 1:n) {
        if (r2[i] <= 0.25) {
            m <- m + 1
            points(x[i], y[i], col = "red")
        }
        else{
            points(x[i], y[i], col = "blue")
        }
    }
    piapprox <- m / (0.25 * n)
    return(((piapprox - pi) / pi))
}
mcpi <- function(n) {
    m <- 0
    x <- runif(n)
    y <- runif(n)
    x1 <- x - 0.5
    y1 <- y - 0.5 #circle has center at (0.5,0.5)
    r2 <- x1^2 + y1^2
    for (i in 1:n) {
        if (r2[i] <= 0.25) {
            m <- m + 1
        }
    }
    piapprox <- m / (0.25 * n)
    return(((piapprox - pi) / pi))
}
mcpiwplot(50)

## Convergence Rate
m <- 20
error <- 1:m
for (i in 1:m) {
    errore <- 1:100
    for (j in 1:100) {
        errore[j] <- mcpi(i * 15)
    }
    error[i] <- sum(abs(errore)) / 100
}
plot.new()
plot(1:m*20, error, type = "l", xlab = "Sample size", ylab ="Error" )
