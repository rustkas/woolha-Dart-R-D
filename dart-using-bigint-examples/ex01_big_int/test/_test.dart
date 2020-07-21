import 'package:test/test.dart';

void main() {
  group('BigInt ', () {
    test('max int', () {
      var value = int.tryParse('9223372036854775807');
      value++;
      expect(value, -9223372036854775808);
    });
    test('round 1.6', () {
      expect(BigInt.from(1.6), BigInt.from(1));
    });

    test('constants', () {
      expect(BigInt.zero, BigInt.from(0));
      expect(BigInt.one, BigInt.from(1));
      expect(BigInt.two, BigInt.from(2));
    });

    test('parse', () {
      expect(BigInt.parse('9223372036854775807'),
          BigInt.from(9223372036854775807));
      expect(BigInt.parse('1000', radix: 2), BigInt.from(8));
      expect(BigInt.parse('FF', radix: 16), BigInt.from(255));
    });
  });
}
