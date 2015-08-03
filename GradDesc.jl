x = rand(1:100, 1000)
par = rand(2:4, 1000)
y = x.*par + 10

convergeCrit = .0001
m = length(x)

# Version that uses recursion
function gradDesc(x, y, theta0, theta1, α, i)
  
  i+=1
  
  predY = theta0 + x*theta1

  orgtheta0 = theta0
  orgtheta1 = theta1
  theta0 = theta0 - α*mean(x)*(1/m)*sum(predY - y)
  theta1 = theta1 - α*(1/m)*sum((predY - y).*x)
  
  # @printf "theta0 = %f, theta1 = %f \n" theta0 theta1

  
  if (abs((1/m)*sum(predY - y)) > convergeCrit || 
      abs((1/m)*sum((predY - y).*x)) > convergeCrit)
    
    gradDesc(x, y, theta0, theta1, α, i)
  else
    @printf "convergeCrit0 = %f, convergeCrit1 = %f, recursions = %d \n" abs(theta0 - orgtheta0) abs(theta1 - orgtheta1) i 
    
    return(theta0, theta1)
  end
end

gradDesc(x, y, 0, 0, .0001, 0)

### Version without recursion
function gradDesc(x, y, α)
  
  convergeStatus = Float32[999, 999]
  currentThetas = Float64[0,0]

  i=0
  
  while (abs(convergeStatus[1]) > convergeCrit) || (abs(convergeStatus[2]) > convergeCrit)
    predY = currentThetas[1] + x*currentThetas[2]

    orgThetas = currentThetas
    currentThetas[1] = currentThetas[1] - α*mean(x)*(1/m)*sum(predY - y)
    currentThetas[2] = currentThetas[2] - α*(1/m)*sum((predY - y).*x)

    convergeStatus = (1/m)*sum(predY - y), (1/m)*sum((predY - y).*x)

    i+=1
  end

  @printf "convergeCrit0 = %f, convergeCrit1 = %f, loops = %d \n" convergeStatus[1] convergeStatus[2] i 
  return currentThetas
  
end

gradDesc(x, y, .0001)

linreg(x,y)

