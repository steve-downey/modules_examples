export module M2;
import stuff;
#include "decl.h" // provides struct X; (not a definition)

export template <typename T>
void g(T t) {
    X* x;
    bar(t, x);
}
