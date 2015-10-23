
## My functions miraculously work on a test script!
## They also let me practice forking cloning committing and pushing


## This is a function to make and cache the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL # define local variable m
  set <- function(y) {
      x <<- y 
      # y provided by the argument is assigned to x in the enclosing environments
      # the x matrix now contains y
      # if x not in enclosing environment it will create object x in global
      
      m <<- NULL
  }
  get <- function() x
  setinverse <- function(invertedmatrix) m <<- invertedmatrix
  # the arg value from the function is put into m replacing NULL
  getinverse <- function() m
  
 list(get = get, set = set, setinverse = setinverse, getinverse = getinverse) 
 # return a list storing the functions in the function makeCacheMatrix
 # so when we assign makeCacheMatrix to an object it has the functions
 # the functions all have the same environment
  
  }

## This is a function that calculates an inverse
## If the inverse has already been calculated it retrieves it from a cache 

cacheSolve <- function(x, ...) {

  m <- x$getinverse()
  
  if(!is.null(m)) {
          message("getting cached data")
          return(m)
  }       # check if the value stored by makeCacheMatrix is not NULL
 
  data <- x$get ()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
  ## Return a matrix that is the inverse of 'x'
}

