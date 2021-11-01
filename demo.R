## Load library for mvrnorm function
library(MASS)

## Generate data
data <- mvrnorm(n = 1000,
                mu = c(15, 16),
                Sigma = matrix(c(1, .7, .7, 1), nrow = 2, byrow = T)
)
data <- as.data.frame(data)
colnames(data) <- c('x', 'y')

## Perform the regression
reg <- lm(y ~ x, data = data)

## Create a scatterplot of the data
plot(x = data$x, y = data$y,
     main = "A plot of a Regression",
     xlab = 'X', ylab = 'Y',
     pch = 16,
     col = rgb(0/255, 0/255, 0/255, .4)
)

## Add the regression line
abline(reg, lty = 2)