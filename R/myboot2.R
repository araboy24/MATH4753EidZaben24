#' myboot2
#'
#' @param iter
#' what it iterates through
#' @param x
#' data
#' @param fun
#' function
#' @param alpha
#' probability
#' @param cx
#' value of cx
#' @param ...
#' other optional parameters
#'
#' @return
#' a graph
#' @export
#'
#' @importFrom stats quantile
#'
#' @examples
#' myboot2(x=rnorm(25,mean=25,sd=10))
myboot2<-function(iter=10000,x,fun="mean",alpha=0.05,cx=1.5,...){  #Notice where the ... is repeated in the code
  n=length(x)   #sample size

  y=sample(x,n*iter,replace=TRUE)
  rs.mat=matrix(y,nrow=n,ncol=iter,byrow=TRUE)
  xstat=apply(rs.mat,2,fun) # xstat is a vector and will have iter values in it
  ci=quantile(xstat,c(alpha/2,1-alpha/2))# Nice way to form a confidence interval
  # A histogram follows
  # The object para will contain the parameters used to make the histogram
  para=hist(xstat,freq=FALSE,las=1,
            main=paste("Histogram of Bootstrap sample statistics","\n","alpha=",alpha," iter=",iter,sep=""),
            ...)
}
