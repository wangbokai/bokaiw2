## library('RUnit')
## check to see if the totoal probabilities sum up to 1
## p.vec = c(1/2, 1/4, 1/4, 0)

test.equal.one <- function() {
  checkEquals(sum(p.vec), 1)
}