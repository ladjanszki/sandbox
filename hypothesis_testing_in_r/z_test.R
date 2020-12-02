# Plotting the generator distribution
#x <- seq(-4, 4, length=100)
#hx <- dnorm(x)
#plot(x, hx, type="l", lty=1, xlab="x value", ylab="Density", main="Comparison of t Distributions")

 Z-test
 The parameteres of the generating distribution
m <- 1
s <- 1.3
nPoints <- 100
sample <- rnorm(nPoints, m, s)

# Calculating Z-value
m0 <- 1
confidence <- 0.95
z <- (mean(sample) - m0) / (sd(sample) / sqrt(nPoints)) 
z

# Two sided case
zLow = qnorm((1 - confidence)/2)
zHigh = -zLow
print(sprintf("%5.5f %5.5f", zLow, zHigh)

# Check for Z interval
if(zLow <= z & z <= zHigh) {
    print("Calculated Z value is IN RANGE")
    print("Null Hypthesis confirmed")
} else {
    print("Calculated Z value is OUT OF RANGE")
    print("Null Hypthesis NOT confirmed")
}

