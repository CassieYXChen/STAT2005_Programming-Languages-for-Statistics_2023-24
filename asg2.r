# STAT2005 Assignment 2, 1155173751
# Q1(a)
data(pressure)
plot(pressure$temperature, pressure$pressure, xlab = "pressure$temperature", ylab = "pressure$pressure")
curve((0.168 + 0.007*x)^(20/3), from = 0, to = 400, add = TRUE)

# Q1(b)
transformation_pressure <- pressure$pressure^(3/20)
plot(pressure$temperature, pressure$pressure^(3/20), xlab = "pressure$temperature", ylab = "(pressure$pressure)^(3/20)")
# ((0.168 + 0.007*x)^(20/3))(3/20) = 0.168 + 0.007*x
# so intercept = 0.168, slope = 0.007
abline(a = 0.168, b = 0.007, col = "red")
# It's a linear relationship evident now

# Q1(c)
# title is "Pressure against Temperature"
title(main = "Pressure against Temperature")

# Q1(d)
par(mfrow = c(1, 2))
# the first plot:
plot(pressure$temperature, pressure$pressure, xlab = "pressure$temperature", ylab = "pressure$pressure", frame.plot = FALSE, las = 1)
curve((0.168 + 0.007*x)^(20/3), from = 0, to = 400, add = TRUE)
# the second plot:
plot(pressure$temperature, pressure$pressure^(3/20), xlab = "pressure$temperature", ylab = "(pressure$pressure)^(3/20)", frame.plot = FALSE, las = 1)
abline(a = 0.168, b = 0.007, col = "red")


# Q2
alt_matrix <- function(n) {
  matrix(rep(c(0, 1)), nrow = n, ncol = n, byrow = TRUE)
}
alt_matrix(7)


# Q3
# Reset the graph format from Q1
par(mfrow = c(1,1))
# Plot the table first
plot(0, 0, type = "n", xlim = c(0,10), ylim = c(0,10), bty = "n", xlab = "", ylab = "")
# Red part:
x_start <- 0
x_end <- 10
y <- 0
lines(c(x_start, x_end), c(y, y), col = "red")
for (i in 1:5) {
  x_start <- i-1
  x_end <- 10 - i
  y <- i
  lines(c(x_start, x_end), c(y, y), col = "red")
}
# Orange part:
for (i in 6:10) {
  x <- i
  y_start <- 10-i
  y_end <- i
  lines(c(x, x), c(y_start, y_end), col = "orange")
}
# Green part: 
for (i in 6:10) {
  x_start <- 10-i
  x_end <- i
  y <- i
  lines(c(x_start, x_end), c(y, y), col = "green")
}
# Blue part: 
for (i in 0:4) {
  x <- i
  y_start <- i+1
  y_end <- 10-i
  lines(c(x, x), c(y_start, y_end), col = "blue")
}


# Q4
# prime numbers are integers > 1
twin_primes <- c()
for (x in 2:1000) {
  is_x_prime <- all(x %% 2:(sqrt(x)) != 0)
  is_y_prime <- all((x + 2) %% 2:(sqrt(x + 2)) != 0)
  if (is_x_prime && is_y_prime) {
    twin_primes <- c(twin_primes,  sprintf("(%d,%d)", x, x + 2))
  }
}
print(twin_primes)