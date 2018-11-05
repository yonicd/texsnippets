ts_collect_rows <- function(obj){

  r <- as.numeric(gsub('\\D','',obj))

  if(r%in%c(0,NA)){
    return('')
  }

  adc <- rstudioapi::getSourceEditorContext()

  current_row <- as.numeric(adc$selection[[1]]$range$start)[1] + 1

  rng <- current_row:(current_row+(r-1))

  rng2 <- range(rng)

  rm_rng <- Map(c, Map(c, rng2[1], 1), Map(c, (rng2[2] + 1) , Inf))

  rstudioapi::modifyRange(rm_rng,'',id = adc$id)

  paste0(adc$contents[rng],collapse = '\n')

}
