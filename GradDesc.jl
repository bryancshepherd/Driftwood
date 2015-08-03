x = rand(1:100, 1000)
par = rand(2:4, 1000)
y = x.*par + 10

convergeCrit = .000001
m = length(x)


function gradDesc(x, y, theta0, theta1, α, i)
  
  i+=1
  
  predY = theta0 + x*theta1

  orgtheta0 = theta0
  orgtheta1 = theta1
  theta0 = theta0 - α*mean(x)*(1/m)*sum(predY - y)
  theta1 = theta1 - α*(1/m)*sum((predY - y).*x)
  
  # @printf "theta0 = %f, theta1 = %f \n" theta0 theta1

  
  if (abs(theta0 - orgtheta0) > convergeCrit || 
      abs(theta1 - orgtheta1) > convergeCrit)
    
    gradDesc(x, y, theta0, theta1, α, i)
  else
    @printf "convergeCrit0 = %f, convergeCrit1 = %f, recursions = %d \n" abs(theta0 - orgtheta0) abs(theta1 - orgtheta1) i 
    
    return(theta0, theta1)
  end
end

gradDesc(x, y, 0, 0, .0001, 0)

linreg(x,y)
