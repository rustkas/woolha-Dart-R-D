import 'package:ex02_import/a.dart';

void main() {
  A a;
  a = A();
  a.first = 'New first';
  /*
  Compilation error is below
  */
  // a._second =
  //     'New second'; // The setter _second is not defined for the class 'A'
  // print(
  //     '${a.first}: ${a._second}'); // The getter _second is not defined for the class 'A'
}
