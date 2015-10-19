# Estimate parameters via the Normal Equation: 
# theta = (Xtranspose * X)^-1 * Xtranspose * y

X = randn(10,5)
y = X[:, 1] + 2 * X[:,2] + -.5 * X[:,3] + 1.5 * X[:,4] + 4 * X[:,5]
XtX = X'X
invXtX = inv(XtX)
invXtX*X'*y
