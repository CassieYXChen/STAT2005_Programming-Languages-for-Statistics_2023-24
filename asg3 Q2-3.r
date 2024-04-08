# Q2a
T <- matrix(c(0.5, 0.2, 0.3, 0.3, 0.4, 0.3, 0.4, 0.3, 0.3), nrow = 3, byrow = TRUE)
T2 <- T %*% T
T2

# Q2b
# The initial prob that the TV is on channel 1 (state 1) at 9am:
T0 <- matrix(c(1, 0, 0), nrow = 1, byrow = TRUE)
# 9am to 3pm means 6 hours has passed 
T6 <- T0 %*% T %*% T %*% T %*% T %*% T %*% T
# The prob that the TV is still on channel 1 (state 1) at 3pm: 
T6[1,1]

# Q2c
# The first strategy:
T_new1 <- matrix(c(0.45, 0.25, 0.3, 0.3, 0.4, 0.3, 0.4, 0.3, 0.3), nrow = 3, byrow = TRUE)
# The second strategy:
T_new2 <- matrix(c(0.5, 0.2, 0.3, 0.3, 0.4, 0.3, 0.4, 0.35, 0.25), nrow = 3, byrow = TRUE)
# Calculate eigenvectors for each strategy
eigen_T1 <- eigen(t(T_new1))
eigenvector_T1 <- eigen_T1$vectors[, 1] / sum(eigen_T1$vectors[, 1])

eigen_T2 <- eigen(t(T_new2))
eigenvector_T2 <- eigen_T2$vectors[, 1] / sum(eigen_T2$vectors[, 1])

# Print the eigenvectors
print("Strategy 1:")
print(eigenvector_T1[2])
print("Strategy 2:")
print(eigenvector_T2[2])
if (eigenvector_T1[2] > eigenvector_T2[2]) {
  print("Strategy 1 is more preferable.")
} else {
  print("Strategy 2 is more preferable.")
}
# As 0.31>0.30, strategy 1 is more preferable.


# Q3
# Incorrect statements: acdfgij

# a: CARDS3 should be CARDS or CARDS4. 
# Correction: CARDS;

# c: IN is a library name and NEW is a file name so they cannot be together.
# Correction: DATA NEW.RECORD

# d: The length of numeric variables cannot be 1. 
# Correction: LENGTH A $1 B $12

# f: There should not be a "." after 5-9 and the comment is not properly formatted.
# Correction: INPUT _A C2 – C10 $2 L 5-9. /* L IS NUMERIC */; 

# g: There should be a "." after COMMA4.
# Correction: INPUT @5 (X2 – X5) (COMMA4.); 

# i: The file path should be enclosed in quatations. 
# Correction: INFILE 'C:\DATA.TXT';

# j: The library name should not include "." and the path should be enclosed in either '' or "". 
# Correction: LIBNAME AB 'C:\';
