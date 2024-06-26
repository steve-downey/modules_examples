# Private module fragment[module.private.frag]

https://eel.is/c++draft/module#private.frag-example-1

Example 1:
```C++`
export module A;
export inline void fn_e();      // error: exported inline function fn_e not defined
                                // before private module fragment
inline void fn_m();             // error: non-exported inline function fn_m not defined
static void fn_s();
export struct X;
export void g(X *x) {
  fn_s();                       // OK, call to static function in same translation unit
}
export X *factory();            // OK

module :private;
struct X {};                    // definition not reachable from importers of A
X *factory() {
  return new X ();
}
void fn_e() {}
void fn_m() {}
void fn_s() {}
```
— end example]
