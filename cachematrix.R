## makeCacheMatrix shows functions to get and set the matrix and get and set the its inverse

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
  set <- function(y) {
    x <<- y
		m <<- NULL
  }
	get <- function() x
	setsolve <- function(solve) m <<- solve
	getsolve <- function() m
	l <- list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
	l
}

## cacheSolve verifies if the cached inverse was stored before to retrieve it. If dont, calculates
## using the R solve function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
	m <- x$getsolve()
	if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
	d <- x$get()
  m <- solve(d)
  x$setsolve(m)
  m 
}