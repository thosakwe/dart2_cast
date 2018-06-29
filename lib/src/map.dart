import 'cast_error_impl.dart';
import 'type_matcher.dart';

/// Cast a [map] to another type.
Map<K, V> castMap<K, V>(Map map) => new _MapCaster<K, V>().cast(map);

class _MapCaster<K, V> {
  Map<K, V> cast(Map map) {
    var kMatcher = new TypeMatcher<K>();
    var vMatcher = new TypeMatcher<V>();
    var out = <K, V>{};

    for (var key in map.keys) {
      if (!kMatcher.matches(key)) throw new CannotCastError(K);

      var value = map[key];
      if (!vMatcher.matches(value)) throw new CannotCastError(V);

      out[key as K] = value as V;
    }

    return out;
  }
}
