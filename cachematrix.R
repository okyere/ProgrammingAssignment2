## This function takes a matrix and returns a list of functions
## used for getting, setting a matrix, and setting / setting the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
  
  i = NULL
  
  set = function(y) {
    x <<- y
    i <<- NULL
  }
  
  get = function()x
  
  setinverse = function(inverse){
    
    i <<- inverse
  }
  
  getinverse = function() i
  
  
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}

## This function checks to see if the inverse of the matrix has already been
## calculated. If not, it calculates the inverse of the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i = x$getinverse()
  
  if(!is.null(i)){
    
    message("Getting cached data")
    return (i)
  }
  
  data = x$get()
  i = solve(data)
  x$setinverse(i)
  i
}
