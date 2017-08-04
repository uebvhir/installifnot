#' A installGitifnot Function
#'
#' Download, install and load packages from Github repositories.
#' @param pckgName names of package
#' @param pathGit Repository address in the format username/repo[/subdir].
#' @param proxy TRUE or FALSE. Default value is FALSE. 
#' @param urlproxy proxy domain
#' @param portproxy proxy port
#' @param force.install TRUE to force installation
#' @export installGitifnot
#' @import devtools
#' @author Miriam Mota \email{miriam.mota@@vhir.org}
#' @examples 
#' ## installGitifnot("miriammota","mmotaF",force.install = TRUE)
#' @keywords install require library github


installGitifnot <- function(pathGit, 
                            pckgName, 
                            proxy = FALSE, 
                            urlproxy = "conf_www.ir.vhebron.net", 
                            portproxy = 8081, 
                            force.install = FALSE){
  if (!(require(pckgName, character.only = TRUE)) | force.install) {
    if (proxy) set_config(use_proxy(url = urlproxy, port = portproxy)) 
    install_github(file.path(pathGit,pckgName), force = force.install)
    require(pckgName, character.only = TRUE)
  }
}
