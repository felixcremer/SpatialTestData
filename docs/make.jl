using Documenter, SpatialTestData, TOML

#include("generate_imagelist.jl")

root = joinpath(@__DIR__, "src")

imagelist_preface = """
# [`testdata`](@id imagelist)

The images below can be loaded via `testdata(filename)`.

"""
#generate_imagelist(root, (testdata, SpatialTestData.remotefiles), "imagelist.md", imagelist_preface)

format = Documenter.HTML(edit_link = "master",
                         prettyurls = get(ENV, "CI", nothing) == "true")

makedocs(;
    modules=[SpatialTestData],
    format=format,
    pages=[
        "Home" => "index.md",
        #"Image database" =>
        #    [
            #    "imagelist.md",
        #    ],
        "Function reference" => "functionreference.md",
        "Contributing" => "contributing.md",
    ],
    repo="https://github.com/felixcremer/SpatialTestData.jl/blob/{commit}{path}#L{line}",
    sitename="SpatialTestData.jl",
)

deploydocs(;
    repo="github.com/felixcremer/SpatialTestData.jl",
    # A lot of thumbnails are generated, so compressing history in `gh-pages` avoids infinite
    # storage increasement.
    forcepush=true,
)
