# SpatialTestData

[![][action-img]][action-url]
[![][pkgeval-img]][pkgeval-url]
[![][codecov-img]][codecov-url]
[![Stable][docstable-img]][docstable-url]
[![Dev][docdev-img]][docdev-url]

This package provides a convenient Julia interface for loading spatial test data. 
It is based on the [TestImages](https://github.com/JuliaImages/TestImages.jl) package but provides spatial datasets.

## Documentation

Full documentation and description of the datasets available in SpatialTestData.jl can be found [here][doc-url].

## Installation

Just like all normal Julia packages, you can use Pkg to install it:

```julia
pkg> add SpatialTestData # hit ] to enter Pkg mode
```

## Usage

```julia
using SpatialTestData

img = testimage("s1_jurua_singlelake_large.nc") # fullname
img = testimage("s1_jurua_singlelake_large") # without extension works
```

Test data will be automatically downloaded into artifact folders when you load the dataset for the first time.


## Contributing

A detailed guide on contributing to SpatialTestData.jl can be found in the documentation mentioned above.



<!-- URLS -->

[pkgeval-img]: https://juliaci.github.io/NanosoldierReports/pkgeval_badges/T/SpatialTestData.svg
[pkgeval-url]: https://juliaci.github.io/NanosoldierReports/pkgeval_badges/report.html
[action-img]: https://github.com/felixcremer/SpatialTestData.jl/workflows/Unit%20test/badge.svg
[action-url]: https://github.com/felixcremer/SpatialTestData.jl/actions
[codecov-img]: https://codecov.io/github/felixcremer/SpatialTestData.jl/coverage.svg?branch=master
[codecov-url]: https://codecov.io/github/felixcremer/SpatialTestData.jl?branch=master
[docstable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docstable-url]: https://SpatialTestData.felixcremer.org/stable/
[docdev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[docdev-url]: https://SpatialTestData.felixcremer.org/dev/
[doc-url]: https://SpatialTestData.felixcremer.org
