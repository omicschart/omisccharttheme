#' Custom RMarkdown Theme
#'
#' @param ... Arguments passed to the output format function.
#' @return A modified HTML or PDF output format with the custom theme.
#' @export
pdf_report <- function(toc = TRUE, ...) {
    tex <- system.file("rmarkdown/templates/pdf_report/preamble.tex",
                       package = "omicscharttheme")

    logo <- system.file(
      "rmarkdown/resources/omicschart-logo.png",
      package = "omicscharttheme"
    )
    tx  <- readLines(tex)
    tx2  <- gsub(
      pattern = "\\{omicschart-logo.png\\}",
      replace = paste0("\\{", logo, "\\}"),
      x = tx
    )
    writeLines(tx2, con=tex)

    rmarkdown::pdf_document(
      toc = toc,
      includes = rmarkdown::includes(in_header = tex),
      ...
    )
}
