## a function to simulate samples of a simple Branching process
## n is the number of total generations
## p.vec is vector of offspring distribution
## for instance p.vec = c(1/2, 1/4, 1/4, 0)
## n.sim is the number of independent simulations in each case
## below is the function defined for simulating samples from a simple (BGW) Branching process

bokai.bgw.process = function(n, p.vec, n.sim) {
  ## x.mat is the matrix to store all Xn vectors
  x.mat = matrix(data=rep(0, (n+1)*n.sim), nrow=n.sim, ncol=n+1)

  ## starting with X0=1
  x.mat[,1] = 1

  ## below is the main loops to generate offspring...
  for (i in 1:(n.sim)) {
    for (j in 1:n) {
      for (k in 1:(x.mat[i, j])) {
        xi = 0
        xi = sample(c(0, 1, 2, 3), size=1, prob=p.vec)
        x.mat[i, j+1] = x.mat[i, j+1] + xi
      }
      if (x.mat[i, j+1] == 0) {break}
    }
  }
  return (x.mat)
}

## x.sample is the generated samples of this (BGW) Branching process
## x.sample = bokai.bgw.process(n=10, p.vec=c(1/2, 1/4, 1/4, 0), n.sim=100)
