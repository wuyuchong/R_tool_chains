convolve <- function(a, b) {
  na <- length(a)
  nb <- length(b)
  nab <- na + nb - 1
  xab <- rep(0, nab)

  for (i in 1: na) {
    for (j in 1: nb) {
      xab[i + j - 1] <- xab[i + j - 1] + a[i] * b[j]
    }
  }

  return(xab)
}
