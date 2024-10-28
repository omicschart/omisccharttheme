#' Get the path to the OmicsChart logo
#' @return Character string with the path to the logo
get_logo_path <- function() {
  system.file("rmarkdown/resources/omicschart-logo.png", package = "omicscharttheme")
}
