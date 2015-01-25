## Functions cache inverse matrix of given matrix. All functionality divided
## into two pieces: (1) cache matrix, (2) cache inverse matrix

## Function caches matrix given as an argument and defines four functions 
## which can (1) cache new matrix instead of cashed one, (2) get cached matrix,
## (3) cache inverse of cached matrix, (4) get inverse of cached matrix 

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL 
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## Function either read existing cached inverse or compute inverse and cache it.
## In both cases function print inverse 

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting inverse matrix")
                return(i)
        }
        matr <- x$get()
        i <- solve(matr)
        x$setinverse(i)
        i
}
