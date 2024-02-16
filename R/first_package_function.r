#' myread2
#'
#' @param csv
#'
#' @return
#' @export
#'
#' @examples
myread2=function(csv){
  dird="C:/Users/eidza/OneDrive/Documents/MATH4753/LAB4/"
  fl=paste(dird,csv,sep="")
  read.table(fl,header=TRUE,sep=",")
}
