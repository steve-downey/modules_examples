# Import declaration[module.import]

https://eel.is/c++draft/module#import-example-3

[Example 3:
Interface unit of M1:

``` C++
export module M1;
import M2;
```

Interface unit of M2:

``` C++
export module M2;
import M3;
```

Interface unit of M3:

``` C++
export module M3;
import M1;              // error: cyclic interface dependency M3 →M1 →M2 →M3
```

— end example]
