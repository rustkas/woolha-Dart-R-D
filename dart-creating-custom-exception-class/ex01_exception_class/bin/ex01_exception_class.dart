void main() {
  List<int> values;
  values = [-1, 50, 200, null];

  values.forEach((value) {
    try {
      validateValue(value);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  });
}

class ValueException implements Exception {
  String _message;

  ValueException([String message = 'Invalid value']) {
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

void validateValue(int value) {
  if (value == null) {
    throw ValueException();
  } else if (value <= 0) {
    throw ValueException('Value must be greater than 0');
  } else if (value > 100) {
    throw ValueException('Value must not be greater than 100');
  }
}
