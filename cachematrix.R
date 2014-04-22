## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(myMatrix = matrix()) {
  
  # initiating cache veriable to default at NULL
  cache <- NULL
  
  # set value to matrix
  setMatrix <- function(newValue) {
    myMatrix <<- newValue
    # since the matrix is assigned a new value, clear the cache
    cache <<- NULL
  }
  
  # returns the stored matrix
  getMatrix <- function() {
    myMatrix
  }
  
  # cache the given argument 
  cacheInverse <- function(solvedValue) {
    cache <<- solvedValue
  }
  
  # get the cached value
  getInverse <- function() {
    cache
  }
  
  # return a list. Each named element of the list is a function
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
  # get the cached value
  inverse <- x$getInverse()
  
  # if a cached value exists return it
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  # otherwise get the matrix, caclulate the inverse and store it in the cache
  data <- x$getMatrix()
  inverse <- solve(data)
  x$cacheInverse(inverse)
  
  ## Return a matrix that is the inverse of 'x'
  inverse
  
                      
}
