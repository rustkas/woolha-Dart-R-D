import 'dart:async';

void main() {
  print(DateTime.now());
  Timer(const Duration(seconds: 10), () => print(DateTime.now()));
}
