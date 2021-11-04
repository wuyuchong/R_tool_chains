library(rbenchmark)

library(Rcpp)
sourceCpp(file = "convolve.cpp")
print(convolveCpp(1:5, 1:3))

source("convolve.R")
convolve(1:5, 1:3)

benchmark(convolveCpp(1:50, 1:30), convolve(1:5, 1:3))[, 1:4]
benchmark(convolveCpp(1:500, 1:300), convolve(1:500, 1:300))[, 1:4]
