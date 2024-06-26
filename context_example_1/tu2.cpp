export module M1;
import stuff;
#include "defn.h" // provides struct X {};

export template <typename T>
void f(T t) {
    X x;
    foo(t, x);
}
