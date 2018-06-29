import 'package:collection/collection.dart';

/// Cast an [iterable] to another type.
Iterable<T> castIterable<T>(Iterable iterable) => iterable.cast<T>();

/// Finds elements of the [iterable] of type [U].
Iterable<T> whereType<T>(Iterable iterable) =>
    new DelegatingIterable<T>(iterable.where((x) => x is T).map((x) => x as T));
