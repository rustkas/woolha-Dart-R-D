class A {
  String first;
  String _second;

  String get second {
    return _second;
  }

  set second(String second) {
    _second = second;
  }

  // Fields
  // Getters and setters
  void _printFields() {
    print('First: $first, second: $_second');
  }
}
