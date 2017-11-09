module _foo_t1

import _foo_t2

import foo
@eval foo begin
    struct t1
        x::foo.t2
    end
end

end
