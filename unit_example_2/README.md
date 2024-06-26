# Module units and purviews[module.unit]

https://eel.is/c++draft/module#unit-8

A module-declaration that contains neither an export-keyword nor a module-partition implicitly imports the primary module interface unit of the module as if by a module-import-declaration.
[Example 2:
Translation unit #1:

``` C++
module B:Y;                     // does not implicitly import B
int y();
```

Translation unit #2:

``` C++
export module B;
import :Y;                      // OK, does not create interface dependency cycle
int n = y();
```

Translation unit #3:

``` C++
module B:X1;                    // does not implicitly import B
int &a = n;                     // error: n not visible here
```

Translation unit #4:

``` C++
module B:X2;                    // does not implicitly import B
import B;
int &b = n;                     // OK
```

Translation unit #5:

``` C++
module B;                       // implicitly imports B
int &c = n;                     // OK
```

— end example]
