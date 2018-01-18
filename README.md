parseids
========



[![Build Status](https://travis-ci.org/ropenscilabs/parseids.svg?branch=master)](https://travis-ci.org/ropenscilabs/parseids)


Parsers for Digital Object Identifiers (DOIs) and Other Identifiers

Uses the R pkg [piton](https://github.com/Ironholds/piton) which gives access to the C++ PEG implementation [PEGTL](https://github.com/taocpp/PEGTL).

## Documentation for various identifiers

### DOI

* <https://en.wikipedia.org/wiki/Digital_object_identifier>
* <https://www.doi.org/overview/DOI_article_ELIS3.pdf>

## Example rules

Capture any letter

```
struct name
  : plus< alpha >
{};
```

Capture any digit

```
struct numbers
  : plus< digit >
{};
```

## Grammar

Rules are combined to form a grammar, 

e.g., string must match `name`, then have one comma, then one space, 
then match `numbers`.

```
struct grammar
  : must< name, one< ',' >, space, numbers, eof >
{};
```

Which is then applied to parsing user input strings

## parseids API

 - pid_dois
 - pid_dois_prefixes
 - pid_dois_split
 - pid_dois_suffixes

## Install


```r
devtools::install_github("ropenscilabs/parseids")
```


```r
library("parseids")
```


## pull out DOIs from text strings


```r
pid_dois("Foo 10.1094/PHYTO-04-17-0144-R")
#> [1] "10.1094/PHYTO-04-17-0144-R"
```


```r
pid_dois(c("Foo 10.1094/PHYTO-04-17-0144-R", "adsfljadfa dflj fjas fljasf 10.1094/PHYTO-04-17-0144-R"))
#> [1] "10.1094/PHYTO-04-17-0144-R" "10.1094/PHYTO-04-17-0144-R"
```

## DOI prefixes


```r
pid_dois_prefixes(c("10.1094/PHYTO-04-17-0144-R", "10.5150/cmcm.2011.086"))
#> [1] "10.1094" "10.5150"
```

## DOI suffixes


```r
pid_dois_suffixes(c("10.1094/PHYTO-04-17-0144-R", "10.5150/cmcm.2011.086"))
#> [1] "PHYTO-04-17-0144-R" "cmcm.2011.086"
```

## timing


```r
dois_long <- unlist(replicate(100, dois, simplify = FALSE), TRUE)
length(dois_long)
#> [1] 100000
```


```r
library(microbenchmark)
microbenchmark::microbenchmark(
  pid_dois = pid_dois(dois_long),
  prefixes = pid_dois_prefixes(dois_long),
  suffixes = pid_dois_suffixes(dois_long),
  times = 100
)
#> Unit: milliseconds
#>      expr       min        lq      mean    median       uq      max neval
#>  pid_dois 19.010000 19.999469 22.769354 21.036400 25.34600 44.20803   100
#>  prefixes  6.557008  7.029179  8.514096  7.497874  8.87632 41.34401   100
#>  suffixes 12.521917 13.109023 15.637671 14.249393 18.34672 22.93747   100
```


## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/parseids/issues).
* License: MIT
* Get citation information for `parseids`: `citation(package = 'parseids')`
* Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.

[![rofooter](https://ropensci.org/public_images/github_footer.png)](https://ropensci.org)

