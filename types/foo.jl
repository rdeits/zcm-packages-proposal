module foo
end

@eval foo module bar; end
@eval foo.bar module baz; end
@eval foo module qux; end

unshift!(LOAD_PATH, joinpath(@__DIR__, "foo"))
try
    import _foo_t1
    import _foo_t2
    import _foo_bar_t3
    import _foo_bar_baz_t4
    import _foo_qux_t3
finally
    shift!(LOAD_PATH)
end
