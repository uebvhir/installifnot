#' A inst.all Function
#'
#' Download, install and load packages from Github repositories.
#' @param pckgName names of package
#' @param pathGit If Github package: Repository address in the format username/repo[/subdir] .
#' @param force.install TRUE to force installation
#' @param bioc TRUE if bioconductor package. Default value is FALSE. 
#' @param proxy If Github package: TRUE or FALSE. Default value is FALSE. 
#' @param urlproxy If Github package and TRUE proxy: proxy domain
#' @param portproxy If Github package and TRUE proxy: proxy port
#' @export inst.all
#' @import devtools httr
#' @author Miriam Mota \email{miriam.mota@@vhir.org}
#' @examples 
#' ## cran example: 
#' # inst.all(pckgName = "rpart")
#' # inst.all(pckgName = "rpart", force.install = TRUE)
#' 
#' 
#' # # bioconductor example: 
#' # inst.all(pckgName = "IRanges", bioc = TRUE)
#' # inst.all(pckgName = "IRanges", bioc = TRUE, force.install = TRUE)
#'  
#'  
#' # # github example: 
#' # inst.all(pckgName = "mmotaF", pathGit = "miriammota")
#' # inst.all(pckgName = "mmotaF", pathGit = "miriammota", force.install = TRUE)
#' @keywords install require library github bioconductor cran 


inst.all <- function(pckgName,
                     pathGit = NULL, 
                     bioc = FALSE,
                     proxy = FALSE, 
                     urlproxy = "conf_www.ir.vhebron.net", 
                     portproxy = 8081, 
                     force.install = FALSE){
  
  pckgName <- deparse(substitute(pckgName))
  if (!is.element(pckgName, installed.packages()[,1]) | force.install) {
    if (!is.null(pathGit)) {
      if (proxy) set_config(use_proxy(url = urlproxy, port = portproxy)) 
      install_github(file.path(pathGit,pckgName), force = force.install)
    } else if (bioc) {
      source("http://Bioconductor.org/biocLite.R")
      biocLite(pckgName)
    } else {
      install.packages(pckgName, dep = TRUE)
    }
  }
  
  require(pckgName, character.only = TRUE)
}



