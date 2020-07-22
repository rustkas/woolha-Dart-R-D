import 'package:test/test.dart';

void main() {
  group('Removing Elements from List ', () {
    var strings;
    var length = 0;
    setUp(() {
      strings = ['one', 'two', 'three', 'four', 'five'];
      length = strings.length;
    });
    test('remove', () {
      expect(strings.length, length);
      strings.remove('one');
      expect(strings.length, length-1);
    });
  });
}
