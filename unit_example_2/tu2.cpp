export module B;
import :Y;                      // OK, does not create interface dependency cycle
int n = y();
