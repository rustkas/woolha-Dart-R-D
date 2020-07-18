import 'dart:async';

void main() {
  print('Begin');

  scheduleMicrotask(() => print('MT A'));

  Future.delayed(Duration(seconds: 5), () => print('Future 1'));

  Future(() => print('Future 2'));

  scheduleMicrotask(() => print('MT B'));

  print('End');
}
