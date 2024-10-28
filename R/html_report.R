#' Custom RMarkdown Theme
#'
#' @param ... Arguments passed to the output format function.
#' @return A modified HTML or PDF output format with the custom theme.
#' @export
html_report <- function( toc = TRUE, theme = "united", ...) {
  css <- system.file(
    "rmarkdown/templates/html_report/custom.css",
    package = "omicscharttheme"
  )
  logo = system.file(
    "rmarkdown/resources/omicschart-logo.png",
    package = "omicscharttheme"
  )
  header <- system.file(
    "rmarkdown/templates/html_report/header.html",
    package = "omicscharttheme"
  )
  tx  <- readLines(header)
  tx2  <- gsub(pattern = "omicschart-logo.png", replace = logo, x = tx)
  writeLines(tx2, con=header)

  rmarkdown::html_document(
    toc = toc,
    theme = theme,
    css = css,
    includes = rmarkdown::includes(in_header = header),
    ...
  )
}
