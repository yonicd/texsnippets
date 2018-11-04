#' Add the snippets to your ~/.R/snippets/r.snippets
#'
#' @return A message about the success of the copy.
#' @export
#'
#' @examples
#' \dontrun{
#' add_snippets()
#' }

add_snippets <- function(){
  message("This command will write in ~/.R/snippets/r.snippets")
  message("Do you wish to continue?")
  x <- readline("Type Y/y to confirm.")
  res <- FALSE
  if (tolower(x) == "y"){

    if(!dir.exists('~/.R/snippets')){
      message('Creating directory "~/.R/snippets"')
      dir.create('~/.R/snippets',recursive = TRUE)
    }

    if(!file.exists("~/.R/snippets/r.snippets")){
      message('Creating file "~/.R/snippets/r.snippets"')
      file.create("~/.R/snippets/r.snippets")
    }


    res <- file.append("~/.R/snippets/r.snippets",
                       system.file("snippets.txt",
                                   package = "texsnippets"))
  }
  if (res){
    message("Done!")
    message("Restart RStudio to have access to the snippets.")
  } else {
    message("Copy not done")
  }
}
