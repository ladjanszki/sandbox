# Calculating Z values for different sample sizes check if we get back the significance level

zVal <- function(m0, sample) {
    (mean(sample) - m0) / (sd(sample) / sqrt(length(sample)))
}

# Mean and std. dev. of generating distribution
m <- 1
s <- 1.3

# Null hypothesis
m0 <- 1

# Misc variables
sum <- 0
all <- 0
maxLength <- 1000
zVec <- rep(0, maxLength)

# Main loop
for(i in seq(1:maxLength)) {
    sample <- rnorm(i*10, m, s)
    zz <- zVal(m0, sample)
    zVec[i] <- zz 

    # Debug
    #print(sprintf("%10.6f %8d %2.4f %2.4f %2.4f", zz, length(sample), m, s, m0))

    # Check if significant difference found
    if(zz > 2 | zz < -2) {
        sum <- sum +1
    }

    # All number of trials
    all <- all +1
    
}

print(sum/all)
plot(zVec, type="l", lty=1)
