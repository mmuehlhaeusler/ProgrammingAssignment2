## a function consisting of a bundle of three functions to 1) serve a matrix
## to another function, 2) store the inverse of the same matrix, computed
## elsewhere, and 3) to serve up the stored inverse matrix to another function. 

## God knows why it works, but it does. 

makeCacheMatrix <- function(x = matrix()) {

	imatrix <- NULL
	
	get <- function(){
		 x
	}
	setinverse <- function(invertedthingy){
		imatrix <<- invertedthingy
	}
	getinverse <- function(){
		imatrix
	}

	list(get = get, setinverse = setinverse, getinverse = getinverse)
}


## this checks for a previously computed & stored inverse of the 
## original matrix. If not found, the inverse is generated, and stored in 
## makeCacheMatrix. 

cacheSolve <- function(x, ...) {
imatrix <- x$getinverse()
	
	if(!is.null(imatrix)) {
		message("getting cached data")
		return(imatrix)
		}
	matrix <- x$get()
	imatrix <- solve(matrix, ...)
	x$setinverse(imatrix)
	imatrix

    ## Return a matrix that is the inverse of 'x'
}
