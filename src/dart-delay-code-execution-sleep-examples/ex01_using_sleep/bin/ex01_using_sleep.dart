import 'dart:io';

void main() {
  print(DateTime.now());
  sleep(Duration(seconds: 10));
  print(DateTime.now()); // This will be printed 10 seconds later.
}
