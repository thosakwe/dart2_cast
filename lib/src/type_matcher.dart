class TypeMatcher<T> {
  const TypeMatcher();

  bool matches(x) => x is T;
}
