<!-- README.md is generated from README.Rmd. Please edit that file -->

pkgTemplateR [![](https://img.shields.io/badge/dev%20version-0.0.1-blue.svg)](https://github.com/CTU-Basel/pkgTemplateR) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/CTU-Basel/pkgTemplateR?branch=master&svg=true)](https://ci.appveyor.com/project/CTU-Basel/pkgTemplateR) [![travis](https://api.travis-ci.com/CTU-Basel/pkgTemplateR.svg?branch=master)](https://api.travis-ci.com/CTU-Basel/pkgTemplateR.svg?branch=master) [![codecov](https://codecov.io/github/CTU-Basel/pkgTemplateR/branch/master/graphs/badge.svg)](https://codecov.io/github/CTU-Basel/pkgTemplateR)
=================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================

**Template created by Patrick R. Wright**

If you would like to make use of this template just click the green “Use
this template” button or use [this
link](https://github.com/CTU-Basel/pkgTemplateR/generate) to it and set
up your new R package repository as usual on GitHub.

If you want to work with the continuous integration (CI) modules you
will need to grant [travis](https://travis-ci.com/) and
[AppVeyor](https://ci.appveyor.com) access to your repository. The
config files ([.travis.yml](.travis.yml), [appveyor.yml](appveyor.yml))
for travis and AppVeyor are already in the repository. GitHub actions
builds have already been set up too. They will check if the package runs
on Linux, Windows and macOS. Furthermore they will render the pkgdown
page. For the packagedown page you will need to configure the GitHub
Pages part in the Settings to use the gh-pages branch and the root
directory within.

You will also need to search and replace all occurences of
`pkgTemplateR` with the name that you have chosen for your R package.

Installing from GitHub with devtools
------------------------------------

    devtools::install_github("CTU-Basel/pkgTemplateR")

Basic usage
-----------

Load the package

    # load the package
    library(pkgTemplateR)
    # internal file of the package
    path <- system.file("exdata", "file.txt",
                        package = "pkgTemplateR")
    # print it
    print_file_content(file_path = path)

    ## Hello world!

For contributors
----------------

### Testing with devtools

    # run tests, this assumes you are one directory up from the pkgTemplateR dir
    devtools::test("pkgTemplateR")
    # spell check
    # ignore words character vector allows to exclude technical terms in the check
    ignore_words <- c()
    devtools::spell_check("pkgTemplateR", ignore = ignore_words)

### Linting with lintr

    # lint the package -> should be clean
    library(lintr)
    lint_package("pkgTemplateR", linters = with_defaults(camel_case_linter = NULL,
                                                         object_usage_linter = NULL,
                                                         line_length_linter(125)))

### Building the vignette

    library(rmarkdown)
    render("vignettes/pkgTemplateR-package-vignette.Rmd",
           output_format=c("pdf_document"))

### Generating the README file

The README file contains both standard text and interpreted R code.
Changes should be made in the `README.Rmd` file and the file “knited”
with R. In this template the knitting of the Rmd file is performed
automatically with GitHub actions.

### Handling dependencies

Dependencies to other R packages are to be declared in the `DESCRIPTION`
file under `Imports:` and in the specific `roxygen2` documentation of
the functions relying on the dependency. It is suggested to be as
explicit as possible. i.e. Just import functions that are needed and not
entire packages.

Example to import `str_match` `str_length` `str_wrap` from the `stringr`
package:

    #' @importFrom stringr str_match str_length str_wrap

### Preparing a release on CRAN

    # build the package archive
    R CMD build pkgTemplateR
    # check the archive (should return "Status: OK", no WARNINGs, no NOTEs)
    # in this example for version 0.0.1
    R CMD check pkgTemplateR_0.0.1.tar.gz

### Guidelines for contributors

Requests for new features and bug fixes should first be documented as an
[Issue](https://github.com/) on GitHub. Subsequently, in order to
contribute to this R package you should fork the main repository. After
you have made your changes please run the
[tests](README.md#testing-with-devtools) and
[lint](README.md#linting-with-lintr) your code as indicated above.
Please also increment the version number. If all tests pass and linting
confirms that your coding style conforms you can send a pull request
(PR). Changes should also be mentioned in the `NEWS` file. A test has
been implemented to remind you to make these changes (see
[here](tests/testthat/test-version_diff.R)). The PR should have a
description to help the reviewer understand what has been added/changed.
New functionalities must be thoroughly documented, have examples and
should be accompanied by at least one [test](tests/testthat/) to ensure
long term robustness. The PR will only be reviewed if all travis,
AppVeyor and GitHub actions checks are successful. The person sending
the PR should not be the one merging it.
