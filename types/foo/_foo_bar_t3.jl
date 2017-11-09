module _foo_bar_t3

import foo
@eval foo.bar begin
    import foo
    import _foo_t1
    import _foo_qux_t3
    type t3
        x::foo.t1
        y::foo.qux.t3
    end
end

end