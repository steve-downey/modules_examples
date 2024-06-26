export module stuff;
export template <typename T, typename U>
void foo(T, U u) {
    auto v = u;
}
export template <typename T, typename U>
void bar(T, U u) {
    auto v = *u;
}
