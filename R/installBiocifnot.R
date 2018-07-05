#' A installBiocifnot Function
#'
#' Download, install and load packages from Bioconductor repositories.
#' @param pckgName name of package 
#' @param force.install TRUE to force installation
#' @export installBiocifnot
#' @author Miriam Mota \email{miriam.mota@@vhir.org}
#' @examples
#' # installBiocifnot("CMA")
#' @keywords install require library bioconductor 

installBiocifnot <- function(pckgName, force.install = FALSE){
  if (!is.element(pckgName, installed.packages()[,1]) | force.install) {
    source("http://Bioconductor.org/biocLite.R")
    biocLite(pckgName)
    require(pckgName, character.only = TRUE)
  }
}
