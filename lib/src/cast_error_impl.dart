class CannotCastError extends CastError {
  final Type T;

  CannotCastError(this.T);

  @override
  String toString() {
    return 'Cannot cast to $T; not all elements match the type.';
  }
}
