## Load library for mvrnorm function
library(MASS)

## Generate data
data <- mvrnorm(n = 1000,
                mu = c(15, 16),
                Sigma = matrix(c(1, .7, .7, 1), nrow = 2, byrow = T)
)
data <- as.data.frame(data)
colnames(data) <- c('x', 'y')

## Perform the regressions
reg <- lm(y ~ x, data = data)
reg2 <- lm(y ~ x^2, data = data)
reg3 <- lm(y ~ exp(x), data = data)

## Create scatterplots of the data with regression lines
par(mfrow = c(1, 3))
plot(x = data$x, y = data$y,
     main = "Linear",
     xlab = 'X', ylab = 'Y',
     pch = 16,
     col = rgb(0/255, 0/255, 0/255, .4)
)
abline(reg, lty = 2)

plot(x = data$x, y = data$y,
     main = "Quadratic",
     xlab = 'X', ylab = 'Y',
     pch = 16,
     col = rgb(0/255, 0/255, 0/255, .4)
)
abline(reg2, lty = 2)

plot(x = data$x, y = data$y,
     main = "Logarithmic",
     xlab = 'X', ylab = 'Y',
     pch = 16,
     col = rgb(0/255, 0/255, 0/255, .4)
)
abline(reg3, lty = 2)