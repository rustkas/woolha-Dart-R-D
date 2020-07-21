import 'dart:io';

void main() {
  Stopwatch s;
  s = Stopwatch();
  sleep(Duration(seconds: 1));
  print(s.elapsedMilliseconds); // 0

  s.start();

  sleep(Duration(seconds: 2));
  print(s.isRunning); // true
  print(s.elapsedMilliseconds); // around 1999ms
  sleep(Duration(seconds: 1));

  s.stop();

  print(s.elapsedMilliseconds); // around 2999ms
  print(s.isRunning); // false
  sleep(Duration(seconds: 1));
  print(s.elapsedMilliseconds); // around 3000ms

  s.reset();

  print(s.elapsedMilliseconds); // 0
}
