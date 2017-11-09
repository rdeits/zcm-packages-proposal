# put the ./types directory on the LOAD_PATH
push!(LOAD_PATH, joinpath(@__DIR__, "types"))

# import an entire package of types
import foo

# The types in this package are:
# 
# package foo;
# struct t1 {
#     foo.t2 x;
# }
# 
# package foo;
# struct t2 {
#     int64_t x;
# }
# 
# package foo.bar;
# struct t3 {
#     foo.t1 x;
#     foo.qux.t3 y;
# }
# 
# package foo.bar.baz;
# struct t4 {
#     foo.bar.t3 x;
# }
# 
# package foo.qux;
# struct t3 {
#     foo.t1 x;
#     unpackaged_t y;
# }
# 
# With a single unpackaged type:
# 
# struct unpackaged_t {
#     int64_t x;
# }

# construct a simple type:
println(foo.t2(5))

# construct a type that depends on another `foo` type:
println(foo.t1(foo.t2(5)))

# construct a type that also depends on an unpackaged type:
import _unpackaged_t: unpackaged_t

println(foo.qux.t3(foo.t1(foo.t2(5)), 
                   unpackaged_t(6)))

# construct a horrifying monstrosity of nested types
println(
    foo.bar.baz.t4(foo.bar.t3(foo.t1(foo.t2(1)), 
                              foo.qux.t3(foo.t1(foo.t2(0)), 
                                         _unpackaged_t.unpackaged_t(1))))
)


# construct a type that depends on some types from `foo`:

import other
println(other.t1(foo.t1(foo.t2(0))))
