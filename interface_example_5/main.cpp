import M;
int main() {
  X::f();                       // OK, X is exported and definition of X is reachable
  X::Y y;                       // OK, X::Y is exported as a complete type
  auto f = rootFinder(2);       // OK

// error: invalid use of incomplete type 'A'
//  return A{45}.value;           // error: A is incomplete
  return 0;
}
