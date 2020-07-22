import 'package:ex04_private_function/a.dart';

void main() {
  A a;
  a = A();
  a.first = 'New first';
  a.second = 'New second';
  // Compilation error is here
    // a._printFields(); // The getter _printFields is not defined for the class 'A'
}
