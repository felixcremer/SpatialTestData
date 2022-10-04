# Contributing
## Adding images
Anyone can contribute images to this repository by submitting a pull request at the github repo.

### Step 1: adding images to `images` branch
The following steps should be followed to add an image/imageset to the repository:

1. Check the images for copyright or license issues before adding images.
1. Do `git checkout images` in your local repository folder. `Pkg.dir("SpatialTestData")` gives the location of the repo.
1. Add the image locally to the `images/` folder on your machine.
1. If you have metadata, a more common name, a url for the source or an author, you can add them to the `images/metadata.toml`.
1. Do `git add --all` to stage the changes for a commit.
1. `git commit -m "Adds <filename> to the repository from link <link>"`
1. `git push <fork> images`
1. Now submit a pull request to the `images` branch. Once accepted, the image or imageset will be stored at `https://github.com/felixcremer/SpatialTestData.jl/blob/images/images/<filename>`.

Now that the images are added to the repository, maintainers will then create a tag(not release)
v*-artifacts (e.g., `v0.0.1-artifacts`) for `images` branch and push it to the repo. After that,
github action CI defined in `images` branch will be triggered, build and release an tarball artifact
for this commit.

### Step 2: update `main` branch
The next step is to modify the source files of the `TestImages.jl` package to make them available for download, i.e., add it to `remotefiles` list.

1. Do `git checkout main` to return to the `main` branch.
1. Modify `src/SpatialTestData.jl` : Add an entry with the filename to the remotefiles dictionary.
1. Modify `Artifacts.toml`: updates `[images]` section with the newly released artifacts.
    To do so, copy the sha entries from the example Artifacts.toml which is available on the release page.
1. Do `git add --all` to add the changed source files.
1. `git commit -m "Adds <filename> to package"`
1. `git push <fork> main`
1. Now submit a pull request to the `main` branch. Once accepted, the image or imageset will be available for download to users of `SpatialTestData.jl`.

See [PR#123](https://github.com/JuliaImages/TestImages.jl/pull/123) for an example.

## Others
Feel free to open [issues](https://github.com/felixcremer/SpatialTestData.jl/issues) or [pull-requests](https://github.com/felixcremer/SpatialTestData.jl/pulls).
If you have any questions, you can ask in [Discourse](https://discourse.julialang.org/) or `#geo` channel in [Slack](https://julialang.org/slack/).
