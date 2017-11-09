module _other_t1

import other

@eval other begin
    import foo
    type t1
        x::foo.t1
    end
end

end
