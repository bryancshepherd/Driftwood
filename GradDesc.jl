Pkg.init()

Pkg.add("DataFrames")
Pkg.add("StatsBase")
Pkg.add("Distributions")
Pkg.add("NumericExtensions")
Pkg.add("GLM")

using DataFrames
using GLM


x = rand(1:100, 1000)
par = rand(2:4, 1000)
y = x.*par + 2
linout = linreg(x, y)


theta0 = 0
theta1 = .5

convergeCrit = 999
# while convergeCrit >= .01
α = .01
m = length(x)
predY = x*theta1 + theta0
  
theta0 = theta0 - α*(1/m)*sum(predY - y)
theta1 = theta1 - α*(1/m)*sum(predY - y)
  
# end


for i = 1:5
 print(i) 
end
