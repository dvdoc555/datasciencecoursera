## This function creates an object that is a matrix

## The matrix object will cache its inverse and reset the cache if the 
## matrix is set again.



makeCacheMatrix <- function(x = matrix()) {
  
  i<-NULL ##sets the inverst of the Matrix to NULL when the object is created
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  get<- function()x
  setinverse<-function(solve) i<<-solve
  getinverse<- function()i
  
  list( set=set, get=get, setinverse=setinverse,getinverse=getinverse)
  

}


## This function determines if there is a value for i (the matrix inverse)
## and retrieves is if there is and solves, stores and retrieves it if not

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i<-x$getinverse()
  if(!is.null(i)){
    message("I DID THIS ALREADY - HERE")
    return(i)
  }
  data<-x$get()
  i<-solve(data)
  x$setinverse(i)
  i
}
