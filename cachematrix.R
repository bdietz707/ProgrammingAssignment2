## The following two functions are used to compute and cache the 
## inverse of a square invertible matrix. Matrix inversion is often 
## computationally intensive especially inside of a loop.

## Usage Example:
## mi <- makeCacheMatrix(matrix(c(4,3,3,2),2,2)) #Assign the output of the makeCacheMatrix to the mi object
## mi$get() #Returns the matrix
## cacheSolve(mi) #Returns the computed matrix inverse
## cacheSolve(mi) #Returns the cached matrix inverse

## makeCacheMatrix takes a square invertible matrix
## And returns a list of functions to:
## 1.set the value of the matrix
## 2.get the value of the matrix
## 3.set the value of the inverse
## 4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
## inv stores the matrix inverse and is initially set to NULL 
    inv <- NULL

## the set function replaces the square invertible matrix 
## initially passed to makeCacheMatrix and sets inv to NULL
## The <<- assigns a value to an object in an environment 
## different from the current environment. 
## it to be an object in a different environment
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }

## the get function gets the square invertible matrix 
    get <- function() x
 
## the setinv function sets the inverse of the matrix
    setinv <- function(inverse) inv <<- inverse

## the getinv function gets the inverse of the matrix
    getinv <- function() inv

## returns a list of the functions
    list(set = set, get = get,
        setinv = setinv,
        getinv = getinv)
}


## cacheSolve computes the inverse of the matrix and caches 
## the answer. If the inverse was previously cached, it  
## returns the cached version

cacheSolve <- function(x, ...) {

##  gets the inverse of the matrix 
    inv <- x$getinv()

## if the inverse is already cached, returns the inverse    
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }

## gets the square invertible matrix    
    data <- x$get()

## computes the inverse of the matrix    
    inv <- solve(data, ...)
 
## caches the inverse of the matrix    
    x$setinv(inv)

## returns the inverse of the matrix
    inv
    
}


