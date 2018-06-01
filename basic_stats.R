# Random number generation

# Uniform distribution
runif(n=1, min=0, max=1) #Random uniform distribution, 1 number between 0 and 1
runif(n=1000)

hist(runif(n=50000))

# Normal distrubution
random.normal.100 <- rnorm(n=100, mean = 5, sd = 2)
par(mfrow = c(2,2)) # Par changes graphical device (palette) to have 2 rows and 2 column.

plot(random.normal.100)
boxplot(random.normal.100)
hist(random.normal.100)
hist(random.normal.100, freq = F)
curve(dnorm(x, mean=5, sd=2), from = 0, to = 10, add=T, col="red")

# Summary Statistics
mean(random.normal.100)
sd(random.normal.100)

# Replicate for more efficient
random.normal.100.rep <- replicate(n=4, rnorm(100,5,2))
par(mfrow=c(2,2))
apply(X=random.normal.100.rep, MARGIN = 2, FUN = hist)
apply(X=random.normal.100.rep, MARGIN = 2, FUN = mean)
apply(random.normal.100.rep, 2, sd) # If the order is correct, you don't need the names

summary(random.normal.100.rep)

# Spread of experimental trials
sd(apply(random.normal.100.rep, MARGIN = 2, FUN = mean))

#Standard error is standard deviation/sqrt(sample size)
2/sqrt(100) #Compare this with the spread

# Linear Regression
a=5
b=0.7
x <- seq(2, 20)
y_fixed = a + b*x #deterministic part of model

par(mfrow=c(2,1))
plot(y_fixed~x) #deterministic relationship
y.sim.1 <- rnorm(length(x), mean=y_fixed, sd=2.5)
plot(y.sim.1~x)
abline(a=5, b=0.7, lwd=2) # Expected relationship based on known variables

y.sim.1.lm <- lm(y.sim.1 ~ x)
abline(reg = y.sim.1.lm, lty=2, col="red", lwd=2) #Estimated linear model based on simulated data



