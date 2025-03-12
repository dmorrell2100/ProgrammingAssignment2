## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function:
## this function creates an object that stores a matrix & caches the inverse
makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL ##this sets the inverse initially to null
  
  set_matrix <- function(m) {
    x <<- m ##stores the input as a new matrix 
    inv <<- NULL ##resets the inverse to NULL
  }
  
  get_matrix <- function(){ ## retrieves the matrix value from input
    x
  }
  set_inverse_matrix <- function(inverse){ ##takes the inverse input and 
    ## sets it equal to the original inverse variable
    inv <<- inverse
  }
  
  get_inverse_matrix <- function(){ ## retrieves the inverse matrix saved in 
    ## the previous function
    inv
  }
  ##  returns all the functions as a list
  list(set_matrix = set_matrix, get_matrix = get_matrix, set_inverse_matrix 
       = set_inverse_matrix, get_inverse_matrix = get_inverse_matrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Solves for the inverse of matrix "x"
  inv <- x$get_inverse_matrix()
  
  if (!is.null(inv)) { ##this returns the inverse matrix if already stored
    return(inv)
  }
  
  input <- x$get_matrix() ##gets the original matrix to solve for inverse
  inv <-solve(input, ...) ## does the solving (solves for the inverse)
  
  x$set_inverse_matrix(inv) #stores/caches the inverse for later use
  
  inv ## simply returns the inverse matrix
  
}
nrows <- 3  ## Number of rows
ncols <- 3  ## Number of columns
my_matrix <- matrix(c(1, 2, 3, 4, 5, 6, 7, 5, 7), nrow=3, ncol = 3)  ## Create a 3x3 matrix

cache_matrix1 <- makeCacheMatrix(my_matrix)  ## Create the cache-enabled matrix

cacheSolve(cache_matrix1)  ## First run: Computes & caches inverse
cacheSolve(cache_matrix1)  ## Second run: Retrieves cached inverse

cached_inverse <-cache_matrix1$get_inverse_matrix()

cached_inverse
