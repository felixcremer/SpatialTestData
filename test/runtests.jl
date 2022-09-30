using SpatialTestData
using Test

# make sure all remotefiles are valid image files
foreach(SpatialTestData.remotefiles) do img_name
    img = testdata(img_name)
    @test isfile(img)
end

include("utils.jl")


# mismatch handling
# Note: the behavior might change as `remotefiles` changes
err_str = @except_str testimage("nonexistence.png") ArgumentError
@test_reference "references/nonexistence_err.txt" err_str

err_str = @except_str testimage("leans") ArgumentError
@test_reference "references/leans_err.txt" err_str

err_str = @except_str testimage("abcd.png") ArgumentError
@test_reference "references/abcd_err.txt" err_str

err_str = @capture_err testimage("camereman")
@test_reference "references/camereman_warning.txt" split(err_str, "\n")[1]