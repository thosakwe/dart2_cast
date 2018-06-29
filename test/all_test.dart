import 'package:dart2_cast/dart2_cast.dart';
import 'package:test/test.dart';

void main() {
  var throwsCastError =
      throwsA(predicate((x) => x is CastError, 'throws a cast error'));

  test('whereType', () {
    expect(whereType<int>([1, 2.0, '3', -4]).toList(), [1, -4]);
  });

  test('castIterable works', () {
    expect(() => print(castIterable<int>(<num>[1, 2, 3]).toList()),
        isNot(throwsCastError));
  });

  test('castIterable coerces types', () {
    expect(
      () => print(castIterable<int>([1, 2, '3']).toList()),
      throwsCastError,
    );
  });

  test('castMap works', () {
    expect(
        () => print(castMap<String, int>(<dynamic, dynamic>{'0': 0, '1': 1})),
        isNot(throwsCastError));
  });

  test('castMap coerces types', () {
    expect(
        () =>
            print(castMap<String, double>(<dynamic, dynamic>{'0': 0, '1': 1})),
        throwsCastError);
  });
}
