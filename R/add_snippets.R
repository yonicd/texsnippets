#' @title setup texsnippets
#' @description Add the snippets to your ~/.R/snippets/r.snippets
#' @return A message about the success of the copy.
#' @export
#'
#' @examples
#' \dontrun{
#' use_texsnippets()
#' }

use_texsnippets <- function(){

    res_dir <- add_dir()

    if(!res_dir)
      return('snippets not enabled')

    res_file <- add_file()

    if(!res_file)
      return('snippets not enabled')

    update_texsnippets()
}

#' @title update texsnippets
#' @description Update snippets in ~/.R/snippets/r.snippets using current package snippets
#' @return A message about the success of the copy.
#' @export
#'
#' @examples
#' \dontrun{
#' update_texsnippets()
#' }
#'
update_texsnippets <- function(){

  current_snippets <- readLines('~/.R/snippets/r.snippets')

  if(length(current_snippets)==0){
    current_snippets <- ''
  }

  current_idx <- which(grepl('# texsnippets ####',current_snippets))

  if(length(current_idx)==0){
    current_idx <- c(1,1)
  }

  package_snippets <- readLines(system.file("snippets.txt", package = "texsnippets"))

  if(!identical(package_snippets,current_snippets[seq(current_idx[1],current_idx[2])])){

    message("Update r.snippets file with current texsnippets?")

    x <- readline("Type Y/y to confirm.")

    res <- tolower(x) == "y"

    if(res){

      new_snippets <- c(current_snippets[-seq(current_idx[1],current_idx[2])],
                            package_snippets)


      cat(new_snippets,file = '~/.R/snippets/r.snippets',sep = '\n')

    }

    if (res){

      message("Done!")

      message("Restart RStudio IDE to have access to the updated snippets.")

    } else {

      message("Copy not done")

    }

  }
}

add_dir <- function(){

  res <- dir.exists('~/.R/snippets')

  if(!res){

    message("Create new directory ~/.R/snippets ?")

    x <- readline("Type Y/y to confirm.")

    res <- tolower(x) == "y"

    if (res){

      message('Creating directory "~/.R/snippets"')
      dir.create('~/.R/snippets',recursive = TRUE)

    }
  }

  res
}

add_file <- function(){

  res <- file.exists("~/.R/snippets/r.snippets")

  if(!res){

    message("Create new file ~/.R/snippets/r.snippets ?")

    x <- readline("Type Y/y to confirm.")

    res <- tolower(x) == "y"

    if (res){

      message('Creating file "~/.R/snippets/r.snippets"')
      file.create("~/.R/snippets/r.snippets")

    }
  }

  res
}

check_snippets <- function(){

  current_snippets <- readLines('~/.R/snippets/r.snippets')

  if(length(current_snippets)==0){
    current_snippets <- ''
  }

  current_idx <- which(grepl('# texsnippets ####',current_snippets))

  if(length(current_idx)==0){
    current_idx <- c(1,1)
  }

  package_snippets <- readLines(system.file("snippets.txt", package = "texsnippets"))

  identical(package_snippets,current_snippets[seq(current_idx[1],current_idx[2])])

}

init <- function(){
  if(!dir.exists('~/.R/snippets')|!file.exists("~/.R/snippets/r.snippets")){
    message('snippets not set up run texsnippets::use_texsnippets()')
  }else{
    if(!check_snippets()){
      message('texsnippets not updated with current package snippets, run texsnippets::update_texsnippets() to update')
    }
  }
}
