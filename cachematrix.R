## Put comments here that give an overall description of what your
## functions do

## Exactly the same as the makeVector function, just changed some varnames for clarity

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Exactly the same as cache mean function, just exchanged the "mean" function
## with the "solve" function and edited varnames for clarity

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(x)
        x$setinverse(i)
        i
}
