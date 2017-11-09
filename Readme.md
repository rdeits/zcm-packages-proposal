## Demo

See `demo.jl`

## Generating a Type

Let's say our type is foo.bar.baz.t1

* Create file foo/_foo_bar_baz_t1.jl
* emit `module _foo_bar_baz_t1`
* emit `import foo`
* emit `eval foo.bar.baz begin`
* for each dependent type, do:
    * if dependent type is in package foo (or any subpackage of foo), do:
        * emit `import _foo_bar_dependent_t`
    * else 
    	* if dependent type has package:
    		* let p = top-most package of dependent type
    		* emit `import p`
    	* else:
    		* emit `import _typename: typename`
* emit all ZCM type code
* emit `end`
* emit `end`

## Generating a Module

Let's say our package is `foo.bar`

* Create file `foo.jl`
* emit `module foo; end`
* for each subpackage `bar` in `foo` do:
	* emit `@eval foo module bar; end`
* emit `unshift!(LOAD_PATH, joinpath(@__DIR__, "foo"))` so that Julia knows to look in the `foo` folder
* We'll wrap the imports in a `try...finally` to ensure that the `LOAD_PATH` modification is always undone no matter what
* emit `try`
* For each type anywhere in `foo` do:
	* emit `import _foo_bar_t1`
* emit `finally`
* emit `shift!(LOAD_PATH)`
* emit `end`
