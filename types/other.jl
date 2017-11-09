module other
end

unshift!(LOAD_PATH, joinpath(@__DIR__, "other"))
try
    import _other_t1
finally
    shift!(LOAD_PATH)
end
