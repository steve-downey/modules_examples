module M;
int    a = use_f<int>(); // OK
//int    b = use_g<int>(); // error: no viable function for call to g;
                         // g is not decl-reachable from purview of
                         // module M's interface, so is discarded
int c = use_h<int>();    // OK
