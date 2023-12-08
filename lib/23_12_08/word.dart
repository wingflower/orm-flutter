class StrongBox<E> {
  E? _data;

  void put(E data) {
    _data = data;
  }

  Object? get() {
    return _data;
  }
}
