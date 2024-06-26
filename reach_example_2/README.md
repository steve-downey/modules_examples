# Reachability[module.reach]


https://eel.is/c++draft/module#reach-5

[Note 5: Declarations of an entity can be reachable even where they cannot be found by name lookup. — end note]
[Example 2:
Translation unit #1:
export module A;
struct X {};
export using Y = X;

Translation unit #2:
import A;
Y y;                // OK, definition of X is reachable
X x;                // error: X not visible to unqualified lookup
— end example]
