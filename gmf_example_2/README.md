 Global module fragment[module.global.frag]

https://eel.is/c++draft/module#global.frag-example-2

[Example 2:
Source file "foo.h":
```C++
namespace N {
  struct X {};
  int d();
  int e();
  inline int f(X, int = d()) { return e(); }
  int g(X);
  int h(X);
}
```
Module M interface:
```C++
module;
#include "foo.h"
export module M;
template<typename T> int use_f() {
  N::X x;                       // N​::​X, N, and ​::​ are decl-reachable from use_f
  return f(x, 123);             // N​::​f is decl-reachable from use_f,
                                // N​::​e is indirectly decl-reachable from use_f
                                //   because it is decl-reachable from N​::​f, and
                                // N​::​d is decl-reachable from use_f
                                //   because it is decl-reachable from N​::​f
                                //   even though it is not used in this call
}
template<typename T> int use_g() {
  N::X x;                       // N​::​X, N, and ​::​ are decl-reachable from use_g
  return g((T(), x));           // N​::​g is not decl-reachable from use_g
}
template<typename T> int use_h() {
  N::X x;                       // N​::​X, N, and ​::​ are decl-reachable from use_h
  return h((T(), x));           // N​::​h is not decl-reachable from use_h, but
                                // N​::​h is decl-reachable from use_h<int>
}
int k = use_h<int>();
  // use_h<int> is decl-reachable from k, so
  // N​::​h is decl-reachable from k
```
Module M implementation:
```C++
module M;
int a = use_f<int>();           // OK
int b = use_g<int>();           // error: no viable function for call to g;
                                // g is not decl-reachable from purview of
                                // module M's interface, so is discarded
int c = use_h<int>();           // OK
```
— end example]
