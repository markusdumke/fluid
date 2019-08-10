
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fluid

The goal of fluid is to provide useful functions for your R programming
workflow.

## Installation

You can install fluid from Github with:

``` r
remotes::install_github("markusdumke/fluid")
```

## Summarize a data.frame

``` r
library(fluid)

summarize(iris)
#> data.frame: 150 x 5
#> 
#> Column types:
#> factor numeric
#>      1       4
#> 
#> Numeric columns:
#>          column   type min q_0.25 median  mean q_0.75 max n_NA
#> 1: Sepal.Length double 4.3    5.1   5.80 5.843    6.4 7.9    0
#> 2:  Sepal.Width double 2.0    2.8   3.00 3.057    3.3 4.4    0
#> 3: Petal.Length double 1.0    1.6   4.35 3.758    5.1 6.9    0
#> 4:  Petal.Width double 0.1    0.3   1.30 1.199    1.8 2.5    0
#> 
#> Categorical columns:
#> $ Species
#>         value  N  Prop
#> 1:     setosa 50 0.333
#> 2: versicolor 50 0.333
#> 3:  virginica 50 0.333
#> 4:       <NA>  0 0.000
```

``` r
library(nycflights13)

flights$carrier %>% freq_table(.cum = TRUE)
#> Lumped together 7 categories to Other.
#>        .x     N  Prop  Cum.N Cum.Prop
#>  1:    UA 58665 0.174  58665    0.174
#>  2:    B6 54635 0.162 113300    0.336
#>  3:    EV 54173 0.161 167473    0.497
#>  4:    DL 48110 0.143 215583    0.640
#>  5:    AA 32729 0.097 248312    0.737
#>  6:    MQ 26397 0.078 274709    0.815
#>  7:    US 20536 0.061 295245    0.876
#>  8:    9E 18460 0.055 313705    0.931
#>  9:    WN 12275 0.036 325980    0.967
#> 10: Other 10796 0.032 336776    0.999
#> 11:  <NA>     0 0.000 336776    0.999
```

## Sequence generators

``` r
seq_date("2019-01-01", "2019-12-31", .by = "month")
#>  [1] "2019-01-01" "2019-02-01" "2019-03-01" "2019-04-01" "2019-05-01"
#>  [6] "2019-06-01" "2019-07-01" "2019-08-01" "2019-09-01" "2019-10-01"
#> [11] "2019-11-01" "2019-12-01"
seq_date("2019-01-01", .length.out = 10)
#>  [1] "2019-01-01" "2019-01-02" "2019-01-03" "2019-01-04" "2019-01-05"
#>  [6] "2019-01-06" "2019-01-07" "2019-01-08" "2019-01-09" "2019-01-10"
seq_date("2018-09-01", "2018-09-10", .by = 2L)
#> [1] "2018-09-01" "2018-09-03" "2018-09-05" "2018-09-07" "2018-09-09"
seq_date("2018-09-01", "2018-09-05")
#> [1] "2018-09-01" "2018-09-02" "2018-09-03" "2018-09-04" "2018-09-05"
```
