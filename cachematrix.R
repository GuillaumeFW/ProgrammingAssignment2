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
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}






makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}