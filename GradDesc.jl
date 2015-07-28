Pkg.add("DataFrames")
Pkg.add("StatsBase")
Pkg.add("GLM")

using DataFrames
using GLM

x = rand(1:100, 1000)
par = rand(2:4, 1000)
y = x.*par
linout = linreg(x, y)
