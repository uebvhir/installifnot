#' A installifnot Function
#'
#' Download, install and load packages from CRAN-like repositories.
#' @param pckgName names of package 
#' @export installifnot
#' @author Miriam Mota \email{miriam.mota@@vhir.org}
#' @examples 
#' ## installifnot("rpart")
#' @keywords install require library 


installifnot <- function(pckgName){
  if (!(require(pckgName, character.only = TRUE))) {
    install.packages(pckgName, dep = TRUE)
    require(pckgName, character.only = TRUE)
  }
}
