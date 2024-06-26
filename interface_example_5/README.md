#  Export declaration[module.interface]

https://eel.is/c++draft/module#interface-example-5

[Note 3: Names introduced by exported declarations have either external linkage or no linkage; see [basic.link]. Namespace-scope declarations exported by a module can be found by name lookup in any translation unit importing that module ([basic.lookup]). Class and enumeration member names can be found by name lookup in any context in which a definition of the type is reachable. — end note]

[Example 5:
Interface unit of M:

``` C++
export module M;
export struct X {
  static void f();
  struct Y { };
};

namespace {
  struct S { };
}
export void f(S);               // OK
struct T { };
export T id(T);                 // OK

export struct A;                // A exported as incomplete

export auto rootFinder(double a) {
  return [=](double x) { return (x + a/x)/2; };
}

export const int n = 5;         // OK, n has external linkage
```

Implementation unit of M:

``` C++
module M;
struct A {
  int value;
};
```

Main program:

``` C++
import M;
int main() {
  X::f();                       // OK, X is exported and definition of X is reachable
  X::Y y;                       // OK, X​::​Y is exported as a complete type
  auto f = rootFinder(2);       // OK
  return A{45}.value;           // error: A is incomplete
}
```

— end example]
