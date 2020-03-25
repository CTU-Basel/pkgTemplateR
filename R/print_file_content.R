#' A function which reads the text from a file and prints it
#'
#' @param file_path character - path to the file
#' @importFrom readr read_file
#' @export
#' @examples
#' path <- system.file("exdata", "file.txt",
#'                     package = "pkgTemplateR")
#' print_file_content(file_path = path)
print_file_content <- function(file_path) {
  cat(read_file(file_path))
}
