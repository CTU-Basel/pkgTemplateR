context("print file content")

path <- system.file("exdata", "file.txt",
                    package = "pkgTemplateR")

test_that("Test fail", {
  expect_error(print_file_content(1337))
  expect_error(print_file_content("acharacterstring"))
})

test_that("Test output", {
  expect_equal(NULL, print_file_content(path))
  expect_equal("Hello world!", capture.output(print_file_content(path)))
})
