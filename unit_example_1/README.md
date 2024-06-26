# Module units and purviews[module.unit]

https://eel.is/c++draft/module#unit-example-1

[Example 1:
Translation unit #1:

``` C++
export module A;
export import :Foo;
export int baz();
```

Translation unit #2:

``` C++
export module A:Foo;
import :Internals;
export int foo() { return 2 * (bar() + 1); }
```

Translation unit #3:

``` C++
module A:Internals;
int bar();
```

Translation unit #4:

``` C++
module A;
import :Internals;
int bar() { return baz() - 10; }
int baz() { return 30; }
```

Module A contains four translation units:
- a primary module interface unit,
- a module partition A:Foo, which is a module interface unit forming part of the interface of module A,
- a module partition A:Internals, which does not contribute to the external interface of module A, and
- a module implementation unit providing a definition of bar and baz, which cannot be imported because it does not have a partition name.
— end example]
