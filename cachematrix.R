## The following function calculates the inversed matrix for the input matrix.
## If the inversed matrix is available in the cache because it has been
## previously calculated, then the value returned is the one from the cache.
## By returning the cached value, the function is aiming to optimize the 
## resource usage and the performances.

## ----- Please note the following -----
## To inver the matrix the solve function has been used as stated
## in the following forum thread:
## https://class.coursera.org/rprog-003/forum/thread?thread_id=227
## and in the programming assignment instructions:
## "Computing the inverse of a square matrix can be done with the 
## solve function in R#
## This function only applies to rectangular matrixes.

## ----- usage example -----
## If you would like to test this assignment, 
## please enter the following lines in your console
## after loading the function.
## 
## Only the lines with a '>' sign are code lines, all other lines
## are simple comments to explain the code or output.
##
## The following commands are also available in the file
## tryMe.R
## in this same github repository (to avoid you the copy&pasting)
## 
## > myMatrix <- c(1,1,1,0) 
## > dim(myMatrix) <- c(2,2) # myMatrix is a 2 by 2 matrix
## > cacheMatrix <- makeCacheMatrix(myMatrix)
## because the inversed matrix has not been set yet,
## the cacheMatrix$getinversed call will return a NULL and
## > cacheMatrix$getinversed
## when calling the cacheSolve function, the following comment is prompted
## > cacheSolve(cacheMatrix)
## calculating inversed matrix
## [,1] [,2]
## [1,]    0    1
## [2,]    1   -1
## try now to rerun the cacheSolve function
## > cacheSolve(cacheMatrix)
## and you'll get the following output
## getting cached inversed matrix
## [,1] [,2]
## [1,]    0    1
## [2,]    1   -1
## because the inversed matrix has been read from the cache

## This function creates a special "matrix" object that can cache its inverse
## mi: stores the inversed matrix
## x:  stores the original matrix to be inverted (global)
## m:  stores the matrix to be inverted (local to the function)
## the fucntion makeCacheMatrix defines a list of valid functions
## that allows to set and get the matrix to be transformed,
## to set and get the inverted matrix and
## the list of the functions available
makeCacheMatrix <- function(x = matrix()) {
  mi <- NULL
  # the inversed matrix is reset in case the original matrix is changed
  set <- function(u) {
    x <<- u
    mi <- NULL
  }
  
  get <- function() x 
  setinversed <- function(m) mi <<- m 
  getinversed <- function() mi 
  list(set = set, get = get,
       setinversed = setinversed,
       getinversed = getinversed)
}

## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.
## A message is also returned to the user to understand
## if the inversed matrix has been calculated or returned.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  mi <- x$getinversed()
  if(!is.null(mi)) { 
    message("getting cached inversed matrix")
    return(mi)
  }
  message("calculating inversed matrix")
  data <- x$get()
  m <- solve(data, ...)
  x$setinversed(m)
  m
}