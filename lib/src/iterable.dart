import 'package:collection/collection.dart';
import 'cast_error_impl.dart';
import 'type_matcher.dart';

/// Cast an [iterable] to another type.
Iterable<T> castIterable<T>(Iterable iterable) {
  var matcher = new TypeMatcher<T>();
  return iterable.map((x) {
    if (!matcher.matches(x)) throw new CannotCastError(T);
    return x as T;
  });
}

/// Finds elements of the [iterable] of type [U].
Iterable<T> whereType<T>(Iterable iterable) {
  var matcher = new TypeMatcher<T>();
  return new DelegatingIterable<T>(
      iterable.where(matcher.matches).map((x) => x as T));
}
