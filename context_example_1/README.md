# Instantiation context[module.context]

https://eel.is/c++draft/module#context-example-1

[Example 1:
Translation unit #1:
```C++
export module stuff;
export template<typename T, typename U> void foo(T, U u) { auto v = u; }
export template<typename T, typename U> void bar(T, U u) { auto v = *u; }
```

Translation unit #2:
```C++
export module M1;
import "defn.h";        // provides struct X {};
import stuff;
export template<typename T> void f(T t) {
  X x;
  foo(t, x);
}
```
Translation unit #3:
```C++
export module M2;
import "decl.h";        // provides struct X; (not a definition)
import stuff;
export template<typename T> void g(T t) {
  X *x;
  bar(t, x);
}
```
Translation unit #4:
```C++
import M1;
import M2;
void test() {
  f(0);
  g(0);
}
```
The call to `f(0)` is valid; the instantiation context of `foo<int, X>` comprises
- the point at the end of translation unit #1,
- the point at the end of translation unit #2, and
- the point of the call to `f(0)`,
so the definition of `X` is reachable ([module.reach]).
It is unspecified whether the call to `g(0)` is valid: the instantiation context of `bar<int, X>` comprises
- the point at the end of translation unit #1,
- the point at the end of translation unit #3, and
- the point of the call to `g(0)`,
so the definition of X need not be reachable, as described in [module.reach]. — end example]
