module;
// error: export declaration can only be used within a module purview
// #include "a.h"                  // error: declaration of x is not in the
                                   // purview of a module interface unit
export module M;
// error: anonymous namespaces cannot be exported
// export namespace {}             // error: namespace has internal linkage

namespace {
  // error: export declaration appears within anonymous namespace
  // export int a2;                // error: export of name with internal linkage
}

// error: declaration of 'b' with internal linkage cannot be exported
//  export static int b;            // error: b explicitly declared static

export int f();                 // OK
export namespace N { }          // OK
export using namespace N;       // OK
