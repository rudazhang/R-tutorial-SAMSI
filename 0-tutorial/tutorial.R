## Tutorial on R, the programming language for data analysis.
## author: Ruda Zhang <rzhang@samsi.info>
## date: 2020-02-24

## Get help, you'll need this very often.
## If you are in an R console, this prints the help info;
## If you are in an IDE like RStudio, it shows in a separate window.
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
## Special operations in the form of `%.%`
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


## Object ------------------------------
## "Everything that exists is an object."
## pre-defined objects
pi
letters
LETTERS
month.name
month.abb
## Assignment creates new objects.
x <- 1
## In an interactive session, an object by itself implicitly calls `print()`.
x
print(x)
## Enclose an expression with parentheses to return visibly.
(x <- 1)
print(x <- 1)


## Function ------------------------------
## "Everything that happens is a function call."
## To call a function, type function name and parentheses.
getwd()
## Call help() or ? with an object name to search for help info.
help("getwd")
?getwd
## You may provide an argument to functions.
exp(1)
## Or provide a comma-separated list of arguments.
sum(1, 2)
## Some functions have an indefinite number of arguments.
sum(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
## Arguments are specified eith by position or by argument name.
## For functions with many arguments, use argument name for clarity.
print(pi, digits = 10)
## You don't have to provide arguments with default values.

## Functions are objects too.
c
## To define a function object, provide argument names and a function body.
function(x) x^2
## Call this function object as usual.
(function(x) x^2)(3)
## You can provide default values to an argument.
(function(x = 3) x^2)()
## To use the function later, assign it a name.
square <- function(x) x^2
square
square(3)
## In a compound statement, value of the the last expression is returned.
## Or you can explicitly call `return()`,
## especially when you want to exit before the end of function body.
square <- function(x) {
    y <- x^2
    return(y)
}
square(3)


## More on objects ------------------------------
## An object has three properties (metadata), besides its components.
## length
length(letters)
## type
typeof(letters)
## attributes: name, class, etc.
attributes(iris)
names(iris)
class(iris)
## Many attributes have a replacement form
## to simulates modification of mutable objects.
## So you can change them like this:
(x <- tolower(names(iris)))
names(iris) <- x
names(iris)
## To get an overview of an object:
str(iris)
## To view the first few elements of an object:
head(iris)

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
"apple"
## Check the atomic type of a vector
typeof(1)
typeof(1L)

## Atomic vectors of multiple elements
## 'c' is for concatenation.
c(1, 2, 3, 4)
## This is a (partially) named atomic vector.
c(1, 2, apple = 3, 4)
## integer sequence
1:4
seq(from = 1, to = 4)

## Recursive vector: list
## A list is a collection of (any type of) vectors.
## This is a named list of atomic vectors.
(l <- list(a = 1L, b = pi, c= "e"))
## This is a list of a list and a integer vector.
list(l, seq(3))

## Subsetting a vector: brackets
y <- c(1, 2, 3, 4)
## a subset consisting of the first element only
y[1]
## all elements but the first
y[-1]
## the first and the fourth elements
y[c(1, 4)]
## exclude the two elements
y[-c(1, 4)]

## Access an element
## access by index: double bracket
l[[1]]
## access by name: double bracket
l[["a"]]
## access by name: dollar sign
l$a
## Sub-assignment: assign to specific element/subset
l$a <- 4
l
l[1:2] <- c(-1, 1)
l

## Class ------------------------------
## Classes are used to define new data types.

## Matrix
A <- matrix(c(2, 3, 1, 5), nrow = 2)
A
typeof(A)
class(A)
## Subsetting a matrix
## first row, first colum
A[1, 1]
## first colum
A[, 1]
## first row
A[1, ]
## Linear algebra
## 't' is for transpose
t(A)
## matrix addition is vector addtion
(B <- matrix(c(2, 2, 3, 5), nrow = 2))
A + B
## matrix multiplication
A %*% B
### compare with elementwise/vector multiplication
A * B
## solve a system of linear equations: Ax = b
(A <- matrix(c(2, 1, 1, 5), nrow = 2))
(b <- c(1, 2))
solve(A, b)
## Cholesky decomposition
(R <- chol(A))
## Triangular solvers are faster.
backsolve(R, backsolve(R, b, transpose = TRUE))

## Data frame
## "data.frame" is a named list of equal-length vectors,
## which is an elegant way of organizing related data.
df <- data.frame(char = letters[1:3], number = 1:3)
df
class(df)
df$char
df$number

## Package ------------------------------
## Packages provide functions and data that extend the base R environment.
## Install packages from the CRAN repository
install.packages(c("data.table", "purrr"))
## Load packages
library(data.table)
library(purrr)

## access exported objects in a package: double colon
## In an interactive R session, you don't need to specify the package name
## once you've loaded the package by `library()`.
DT <- data.table::as.data.table(iris)
## data.table is a derived class of data.frame
class(DT)
## It has a nice `print()` method
DT
## And a much richer functionality
DT[, .N, keyby = .(species)]

## `purrr` provides pure functional programming in R.
purrr::map(seq(3), square)


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

## Statistical functions
x <- rnorm(1000)
summary(x)
mean(x)
median(x)
sd(x)

## Plot ------------------------------
## data.table is useful for related data sets.
(DT <- data.table(x = seq(0, 2 * pi, length.out = 10)))
## create a new column
DT[, y := sin(x)]
DT
## basic plot
## points
DT[, plot(x, y)]
## line
DT[, plot(x, y, type = "l")]
## line and points; color; line width.
DT[, plot(x, y, type = "b", col = "red", lwd = 5)]

x <- rnorm(1000)
## histogram
hist(x, col = "gray")
hist(x, breaks = 30, col = "gray")
## empirical cumulative distribution function
plot.ecdf(x, pch = "")


## Statements ------------------------------

## Line comments start with a pound sign `#` (or more)
# You can start a line with comments.
x <- 1 # Or append to any other line.

## Simple statement (any line you've seen so far.)
## If necessary, multiple statements can be written on the same line, separated by semicolon `;`.
x <- 1; print(x)

## Compound statement: statements grouped inside curly brackets `{}`.
## Compound statements are used in function definition,
## and usually in conditional statements and loopos.
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

## Functions as preferable alternatives to conditionals and loops.
## elementwise conditional
x <- -1:1
ifelse(x > 0, TRUE, FALSE)
## loop over a vector: return an atomic vector of known type
vapply(1:3, square, double(1))
## loop over a vector: return a list
lapply(1:3, square)
## loop over a vector for side effects
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
