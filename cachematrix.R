## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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
	##matrix(l,byrow=TRUE,2,2)
	##set(x)
	l
}

## Write a short comment describing this function

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