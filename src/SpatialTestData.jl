module SpatialTestData
using Pkg.Artifacts
using StringDistances
const artifacts_toml = abspath(joinpath(@__DIR__, "..", "Artifacts.toml"))

export testdata

const remotefiles = [
    "s1_jurua_lake.shp"
]

"""
    datapath = testdata(filename; download_only=false, [ops...])

Return the path to a test data set that partially matches `filename`, the first match is used if there're more
than one.

# Example

```julia
julia> using SpatialTestData
julia> img = testdata("cameraman.tif"); # fullname
julia> img = testdata("cameraman"); # without extension works
julia> img = testdata("c"); # with only partial name also works
```

# Extended help

The following is a complete list of test data sets, you can also check them at
https://SpatialTestData.juliadatacubes.org/

$(reduce((x, y)->join([x, "\n - \`\"", splitext(y)[1], "\"\`"]), sort(remotefiles); init=""))
"""
function testdata(filename)
    imagefile = image_path(full_imagename(filename))

    return imagefile
end

"""
    fullname = full_imagename(shortname)

Get the first match of `shortname` in `SpatialTestData.remotefiles`
"""
function full_imagename(filename)
    idx = findfirst(remotefiles) do x
        startswith(x, filename)
    end
    if idx === nothing
        warn_msg = "\"$filename\" not found in `SpatialTestData.remotefiles`."

        best_match = _findnearest(filename)
        if isnothing(best_match[2])
            similar_matches = remotefiles[_findall(filename)]
            if !isempty(similar_matches)
                similar_matches_msg = "  * \"" * join(similar_matches, "\"\n  * \"") * "\""
                warn_msg = "$(warn_msg) Do you mean one of the following?\n$(similar_matches_msg)"
            end
            throw(ArgumentError(warn_msg))
        else
            idx = best_match[2]
            @warn "$(warn_msg) Load \"$(remotefiles[idx])\" instead."
        end
    end
    return remotefiles[idx]
end

function image_path(imagename)
    ensure_artifact_installed("images", artifacts_toml)

    image_dir = artifact_path(artifact_hash("images", artifacts_toml))
    return joinpath(image_dir, imagename)
end

_findall(name; min_score=0.6) = findall(name, remotefiles, JaroWinkler(), min_score=min_score)
_findnearest(name; min_score=0.8) = findnearest(name, remotefiles, JaroWinkler(), min_score=min_score)


function _precompile_()
    ccall(:jl_generating_output, Cint, ()) == 1 || return nothing
    @assert precompile(image_path, (String,))
    @assert precompile(testdata, (String,))
end
VERSION >= v"1.4.2" && _precompile_() # https://github.com/JuliaLang/julia/pull/35378

end # module
