### lst_mdl ###

#' @export
type_sum.lst_mdl <- function(x){
  "model"
}

#' @export
format.lst_mdl <- function(x, ...){
  x %>% map_chr(model_sum) %>% map(function(x) paste0("<", x, ">"))
}

#' @export
c.lst_mdl <- function(x, ...){
  add_class(NextMethod(), "lst_mdl")
}

#' @export
`[.lst_mdl` <- c.lst_mdl

#' @export
print.lst_mdl <- function(x, ...){
  class(x) <- "list"
  print(x)
}

#' @export
c.lst_fc <- function(x, ...){
  add_class(NextMethod(), "lst_fc")
}

#' @export
`[.lst_fc` <- c.lst_fc

#' @export
print.lst_fc <- function(x, ...){
  class(x) <- "list"
  print(x)
}
