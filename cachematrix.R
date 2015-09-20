##The function defines 4 nested functions,
## which are returned as elements of a list.
##(Only setinverse is actually used)
##Setinverse puts the inverse matrix in a global object.

makeCacheMatrix <- function(my_matrix = matrix()) {
		set <- function(y) {
               my_matrix <<- y
                my_inverse <<- NULL
        }
        get <- function() my_matrix
        setinverse <- function(this_inverse){
		 assign("my_inverse", this_inverse, envir = .GlobalEnv) 
		}
        getinverse <- function() my_inverse
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


##This function takes a matrix as its first argument.
##It reads the list of functions into ks.
##It checks whether the global variable my_inverse has been created.
##If true, the object is returned.
##If empty, the inverse is calculated and stored in the global matrix my_inverse.
##The function returns the inverted matrix.

cacheSolve <- function(my_matrix, ...) {
        ## Return a matrix that is the inverse of 'x'
        ks<-makeCacheMatrix()
	if (exists("my_inverse")){
                print("getting cached data")  
                return(my_inverse)
        }
        this_inverse <- solve(my_matrix, ...)
        ks$setinverse(this_inverse)
        my_inverse


}
