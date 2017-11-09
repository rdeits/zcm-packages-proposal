module _foo_qux_t3

import foo
@eval foo.qux begin
    import foo
    import _foo_t1
    import _unpackaged_t: unpackaged_t
    type t3
        x::foo.t1
        y::unpackaged_t
    end
end

end