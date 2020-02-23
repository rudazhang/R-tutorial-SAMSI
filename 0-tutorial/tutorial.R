## Tutorial on R, the programming language for data analysis.
## author: Ruda Zhang <rzhang@samsi.info>
## date: 2020-02-24

## Get help
?help

## Operator ------------------------------
## Numerical operations
## arithmetics
3 + 2
3 - 2
3 * 2
3 / 2
## power
3 ^ 2
## modulo
5 %% 3
## integer division
5 %/% 3

## Comparisons
3 > 2
3 >= 2
3 < 2
3 <= 2
3 == 2
3 != 2

## Logical connectives
## AND
TRUE & FALSE
## OR
TRUE | FALSE
## NOT
!TRUE


## Function ------------------------------
## "Everything that happens is a function call."
## To call a function, type function name and parentheses,
## where you may provide a comma-separated list of arguments.
getwd()
help("getwd")
exp(1)
sum(1, 2)

## Define a function object: argument name, function body.
square <- function(x) x^2
square
square(3)
## In a compound statement, value of the the last express is returned.
## Or you can explicitly call `return()`.
square <- function(x) {
    y <- x^2
    return(y)
}
square(3)


## Object ------------------------------
## "Everything that exists is an object."
## pre-defined objects
pi
letters
LETTERS
month.name
month.abb
## Functions are objects too.
c
## Assignment creates new objects.
x <- 1
## In an interactive session, an object by itself implicitly calls `print()`.
x
print(x)
## Enclose an expression with parentheses to return visibly.
(x <- 1)
print(x <- 1)

## An object has three properties (metadata), besides its components.
## length
length(letters)
## type
typeof(letters)
## attributes
attributes(sleep)
## To get an overview of an object:
str(sleep)

## Atomic vectors (of length one)
## NULL
NULL
## logical
TRUE
FALSE
NA
## integer
1L
## real (double)
1
Inf
NaN
## complex
1i
## character
"alphabet"
## Check the atomic type of a vector
typeof(1)

## Atomic vectors of multiple elements
## 'c' is for concatenation.
c(1, 2, 3, 4)
## integer sequence
1:4
seq(from = 1, to = 4)

## Recursive vector: list
(l <- list(1L, pi, "e"))
l

## Subsetting a vector
y <- c(1, 2, 3, 4)
## a subset of one
y[1]
## all but one
y[-1]
## two elements
y[c(1, 4)]
## exclude two elements
y[-c(1, 4)]

## Access an element
## access by index
l[[1]]
## access by name
names(l) <- c("a", "b", "c")
l[["a"]]
l$a
## Sub-assignment: assign to specific element/subset
l$a <- 4
l
l[1:2] <- c(-1, 1)
l

## Class ------------------------------
## Classes are used to define new data types.

## Matrix
A <- matrix(c(2, 1, 1, 5), nrow = 2)
A
typeof(A)
class(A)
## Subsetting a matrix
A[1, 1]
A[, 1]
A[1, ]
## Linear algebra
## 't' is for transpose
t(A)
## matrix addition
B <- matrix(c(2, 2, 3, 5), nrow = 2)
A + B
## matrix multiplication
A %*% B
### elementwise multiplication
A * B
## solve a system of linear equations: Ax = b
b <- c(1, 2)
solve(A, b)
## Cholesky decomposition
(R <- chol(A))
## Triangular solvers
backsolve(R, backsolve(R, b, transpose = TRUE))

## Data frame
## "data.frame" is a named list of equal-length vectors,
## which is an elegant way of organizing related data.
df <- data.frame(name = letters[1:3], number = 1:3)
df
class(df)
df$name
df$number

## Package ------------------------------
## Packages provide functions and data that extend the base R environment.
## Install packages from the CRAN repository
install.packages(c("data.table", "purrr"))
## Load packages
library(data.table)
library(purrr)

## Statistics ------------------------------
## Sampling
## Uniform distribution
runif(5)
## Normal distribution
rnorm(5)
## Exponential distribution
rexp(5)

## Seed determines the initial state of a random number generator.
set.seed(42)
runif(1)
runif(1)
set.seed(42)
runif(1)

## Probability density function
dnorm(0)
## Cumulative distribution function
pnorm(0)
## Quantile function
qnorm(0.5)

## Statistical function
x <- rnorm(1000)
summary(x)
mean(x)
median(x)
sd(x)

## Plot ------------------------------
x <- seq(0, 2 * pi, length.out = 50)
y <- sin(x)
## basic plot
plot(x, y)
plot(x, y, type = "l")
plot(x, y, type = "b", col = "red", lwd = 5)
## histogram
data <- rnorm(1000)
hist(data, col = "gray")
hist(data, breaks = 30, col = "gray")


## Statements ------------------------------

## Line comments start with a pound sign `#` (or more)
# You can start a line with comments.
x <- 1 # Or append to any other line.

## Simple statement (any line you've seen so far.)
## If necessary, multiple statements can be written on the same line, separated by semicolon `;`.
x <- 1; print(x)

## Compound statement: statements grouped inside curly brackets `{}`.
{
    x <- 1
    y <- 2
    x + y
}

## Conditional statement
if (x > 0) {
    1
} else {
    -1
}
## if ... else ... statements can be combined.
if (x > 0) {
    1
} else if (x == 0) {
    0
} else {
    -1
}
## elementwise conditional
x <- -1:1
ifelse(x > 0, TRUE, FALSE)
## choose from a list of alternatives
x <- "a"
switch(x, a = "apple", b = "banana", c = "cherry", "unknown")

## Loop
## for loop
for (i in seq(3)) {
    print(i)
}
## while loop
i <- 3
while (i > 0) {
    print(i)
    i <- i - 1
}
## Functions as preferable alternatives to loops.
## return an atomic vector of known type
vapply(1:3, square, double(1))
## return a list
lapply(1:3, square)
## for side effects
purrr::walk(1:3, print)


## Import/Export Data ------------------------------
Orange
tree <- Orange$tree
age <- Orange$age
circ <- Orange$circumference
## save multiple objects to a ".rds" file.
saveRDS(tree, file = "tree.rds")
## save multiple objects to a ".RData" file.
save(tree, age, circ, file = "mydata.RData")
# write a data.frame to a ".csv" file.
write.csv(Orange, file = "mydata.csv")
# load the csv file again
df <- read.csv("mydata.csv")
