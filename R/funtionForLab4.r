## put a function in here from lab 3 or 4
## Then document it

#' myread
#'
#' @param csv
#'
#' @return
#' @export
#'
#' @examples
myread=function(csv){
  fl=paste(dird,csv,sep="")
  read.table(fl,header=TRUE,sep=",")
}
