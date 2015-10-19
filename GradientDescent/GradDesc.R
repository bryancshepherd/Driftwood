startX = runif(300, max = 40)
fudge = sample.int(2:4, 300, replace = TRUE)
startY = (startX^2) + fudge

testingData = as.data.frame(list(x=startX, y=startY))

gradDescent <- function(data, bVal = 0, mVal = 0, alpha = .0001) {
  browser()
  bCurrent = bVal
  mCurrent = mVal
  N = nrow(data)
  data$predPoints = (data$x * mCurrent) + bCurrent # Create predicted values based on current b and m
  bDeriv = 0
  mDeriv = 0

  data$predError = sum(data$predPoints - data$y) 
  bDeriv = sum(data$predError)/N
  mDeriv = sum(data$predError*data$x)/N
  
  balpha = alpha*mean(data$x)
  malpha = alpha

  bCurrent = bCurrent - (balpha * bDeriv)
  mCurrent = mCurrent - (malpha * mDeriv)
  
  if (is.na(abs(bDeriv)) | is.na(abs(mDeriv))) browser()
  if (abs(bDeriv) > .0001 | abs(mDeriv) > .0001) {
    gradDescent(data, bCurrent, mCurrent, alpha)
  } else {
    return(c(bCurrent, mCurrent))
  }
  
}


gradDescent(testingData, 0, 0, alpha = .0001)

lm(y ~ x, testingData)
