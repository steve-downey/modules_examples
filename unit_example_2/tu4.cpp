module B:X2;                    // does not implicitly import B
import B;
int &b = n; // OK
