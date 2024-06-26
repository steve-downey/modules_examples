# Reachability[module.reach]

https://eel.is/c++draft/module#reach-note-4

[Note 4: These reachable semantic properties include type completeness, type definitions, initializers, default arguments of functions or template declarations, attributes, names bound, etc. Since default arguments are evaluated in the context of the call expression, the reachable semantic properties of the corresponding parameter types apply in that context.
[Example 1:
Translation unit #1:
``` C++
export module M:A;
export struct B;
```
Translation unit #2:
``` C++
module M:B;
struct B {
  operator int();
};
```
Translation unit #3:
```C++
module M:C;
import :A;
B b1;                           // error: no reachable definition of struct B
```
Translation unit #4:
``` C++
export module M;
export import :A;
import :B;
B b2;
export void f(B b = B());
```
Translation unit #5:
``` C++
import M;
B b3;                           // error: no reachable definition of struct B
void g() { f(); }               // error: no reachable definition of struct B
```
— end example]

— end note]
