import 'dart:async';

void main() {
  for (var i = 0; i < 1000; i++) {
    scheduleMicrotask(() => print('0ABCDE'));
  }
  scheduleMicrotask(() => print('1ABCDE'));
  scheduleMicrotask(() => print('2ABCDE'));
  scheduleMicrotask(() => print('3ABCDE'));
}
