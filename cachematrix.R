##########################################################################
#       Functions makeCacheMatrix and cacheSolve                         #
#                                                                        #
#   Matrix inversion is usually a costly computation, the code in these  #
# functions allows to cache the inverse of a matrix to avoid computation #
# if case the matrix has already been inverted                           #
##########################################################################
#     GC, May 2016                                                       #
##########################################################################


## makeCacheMatrix creates a special object that can cache its inverse
## it allows to: set/get the value of the matrix, set/get the value of the 
## inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        #set the value of the matrix
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        #get the value of the matrix
        get <- function() x
        #set the value of the inverse matrix
        setinv <- function(inverse) inv <<- inverse
        #get the value of the inverse matrix
        getinv <- function() inv
        #creates and return the special matrix object
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}




## cacheSolve returns a matrix that is the inverse of x: it calculates
## it if it doesn't exist, retrieves it from cache otherwise

cacheSolve <- function(x, ...) {
        #check if the inverse matrix has been cached
        inv <- x$getinv()
        #return the cached inverse matrix if it exists
        if(!is.null(inv)) {
                message("getting cached inversed Matrix")
                return(inv)
        }
        #if the cache inverse is empty, calculate the inverse matrix
        mat <- x$get()
        inv <- solve(mat, ...)
        # set the inverse matrix in the cache and return it
        x$setinv(inv)
        inv
        
}


