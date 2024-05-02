#' myread2
#'
#' @param csv
#' input file
#'
#' @return dataframe
#' @export
#' @importFrom utils read.table
#' @examples
#' myread2("data/fire.rda")
myread2=function(csv){
  dird="C:/Users/eidza/OneDrive/Documents/MATH4753/RPACKAGES/MATH4753EidZaben24/"
  fl=paste(dird,csv,sep="")
  read.table(fl,header=TRUE,sep=",")
}
