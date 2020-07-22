import 'dart:async';

void main() {
  print('Begin');

  scheduleMicrotask(() => print('MT A'));

  Future(() => print('Future 1A'))
      .then((_) => print('Future 1B'))
      .then((_) {
        print('Future 1C');

        scheduleMicrotask(() => print('MT 1'));
      })
      .then((_) => Future(() => print('Future 1D')))
      .then((_) => print('Future 1E'));

  scheduleMicrotask(() => print('MT B'));

  Future(() => print('Future 2'));

  scheduleMicrotask(() => print('MT C'));

  print('End');
}
