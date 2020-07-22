import 'dart:io';

import 'package:test/test.dart';

void main() {
  group('StopWatch ', () {
    Stopwatch s;
    setUpAll(() {
      s = Stopwatch();
    });
    test('elapsedMilliseconds', () {
      sleep(Duration(seconds: 1));
      expect(s.elapsedMilliseconds, 0);
      
    });
  });
}
