## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##Creating the cache matrix
makeCacheMatrix <- function(x = matrix()) {
        #Initialization inv
        inv <- NULL
        #Setting the matrix
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        #Getting the matrix
        get <- function() {
                x
        }
        #Setting the inverse matrix
        setinverse <- function(inverse) {
                inv <<- inverse
        }
        #Getting the inverse matrix
        getinverse <- function() { 
                inv
        }
        #Listing the methods
        list(set = set, 
             get = get,
             setinverse = setinverse,
             getinverse = getinverse
             )
}
##To test> B <- matrix(c(1,2,3,4),2,2)
##To test> B1 <- makeCacheMatrix(B)

#Computes the inverse of the makeCacheMatrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse() 
        ## Check if matrix is null or not
        if(!is.null(inv)) {
        ## if matrix is not null then return m with a msg
                message("getting cached data")
                return(inv)
        }
        ##Get the matrix from x
        data <- x$get()
        ## Compute the inverse matrix using ginv()
        inv <- ginv(data)
        ## Update the object by setting new value 
        x$setinverse(inv)
        ## Return the inversed matrix
        inv
}
##To test> cacheSolve(B1)
##To test> cacheSolve(B1)

