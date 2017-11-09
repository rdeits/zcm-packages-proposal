module _foo_bar_baz_t4

import _foo_bar_t3

import foo
@eval foo.bar.baz begin
    import foo
    type t4
        x::foo.bar.t3
    end
end

end