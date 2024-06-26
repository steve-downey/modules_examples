[Example 1:
Source file "a.h":

``` C++
export int x;
```

Translation unit #1:

``` C++
module;
#include "a.h"                  // error: declaration of x is not in the
                                // purview of a module interface unit
export module M;
export namespace {}             // error: namespace has internal linkage
namespace {
  export int a2;                // error: export of name with internal linkage
}
export static int b;            // error: b explicitly declared static
export int f();                 // OK
export namespace N { }          // OK
export using namespace N;       // OK
```

— end example]
