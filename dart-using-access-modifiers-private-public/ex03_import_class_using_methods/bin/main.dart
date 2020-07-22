import 'package:ex03_import_class_using_methods/a.dart';

void main() {
  A a;
  a = A();
  a.first = 'New first';
  a.second = 'New second';
  print('${a.first}: ${a.second}');
}
