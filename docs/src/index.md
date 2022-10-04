# SpatialTestData.jl

This package provides a convenient Julia interface for loading spatial test data. 
It is based on the [TestImages](https://github.com/JuliaImages/TestImages.jl) package but provides spatial datasets.

## Installation
Just like all normal Julia packages, you can use Pkg to install it:

```julia
pkg> add https://github.com/felixcremer/SpatialTestData.jl # hit ] to enter Pkg mode
```

## Usage

This package currently contains two main functions:

- `testdata` that loads existing spatial datasets. Check the [list of test images](@ref imagelist) for what's available.


```@example usage
using TestImages

img = testimage("s1_jurua_singlelake_large.nc") # fullname
img = testimage("s1_jurua_singlelake_large") # without extension works
img = testimage("cam") # with only partial name also works
```
