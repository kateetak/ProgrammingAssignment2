myMatrix <- c(1,1,1,0) 
dim(myMatrix) <- c(2,2) # myMatrix is a 2 by 2 matrix
cacheMatrix <- makeCacheMatrix(myMatrix)
cacheMatrix$getinversed
cacheSolve(cacheMatrix)
## calculating inversed matrix
## [,1] [,2]
## [1,]    0    1
## [2,]    1   -1
## try now to rerun the cacheSolve function
cacheSolve(cacheMatrix)
## and you'll get the following output
## getting cached inversed matrix
## [,1] [,2]
## [1,]    0    1
## [2,]    1   -1
## because the inversed matrix has been read from the cache