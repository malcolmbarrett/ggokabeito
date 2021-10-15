
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggokabeito

<!-- badges: start -->

[![R-CMD-check](https://github.com/malcolmbarrett/ggokabeito/workflows/R-CMD-check/badge.svg)](https://github.com/malcolmbarrett/ggokabeito/actions)
[![Codecov test
coverage](https://codecov.io/gh/malcolmbarrett/ggokabeito/branch/main/graph/badge.svg)](https://app.codecov.io/gh/malcolmbarrett/ggokabeito?branch=main)
<!-- badges: end -->

The goal of ggokabeito is to …

## Installation

You can install the development version of ggokabeito from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("malcolmbarrett/ggokabeito")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ggokabeito)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

## Code of Conduct

Please note that the ggokabeito project is released with a [Contributor
Code of
Conduct](https://malcolmbarrett.github.io/ggokabeito/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
