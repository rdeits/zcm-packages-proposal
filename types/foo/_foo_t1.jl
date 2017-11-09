module _foo_t1

import foo
@eval foo begin
    import _foo_t2
    struct t1
        x::foo.t2
    end
end

end
