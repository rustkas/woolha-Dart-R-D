class A {
  String first;
  String _second;
}

void main() {
  A a;
  a = A();
  a.first = 'New first';
  a._second = 'New second';
  print('${a.first}: ${a._second}');
}
