import 'package:test/test.dart';

void main() {
  group('padLeft ', () {
    String string;
    setUpAll(() {
      string = 'woolha';
    });
    test('default. Padding is space', () {
      final result = string.padLeft(10);
      expect(result.startsWith(' '), isTrue);
      expect(result.endsWith(string), isTrue);
      expect(result.substring(0, 5), '    w');
      expect(result, '    woolha');
    });
    test('default. Padding is dot', () {
      final result = string.padLeft(10, '.');
      expect(result.startsWith('.'), isTrue);
      expect(result.endsWith(string), isTrue);
      expect(result.substring(0, 5), '....w');
      expect(result, '....woolha');
    });
    test('default. Padding is .,', () {
      final result = string.padLeft(10, '.,');
      expect(result.startsWith('.,'), isTrue);
      expect(result.endsWith(string), isTrue);
      expect(result.substring(0, 9), '.,.,.,.,w');
      expect(result, '.,.,.,.,woolha');
    });
    test('no padding', () {
      final result = string.padLeft(3, '.');
      expect(result.startsWith(string), isTrue);
      expect(result.endsWith(string), isTrue);
      expect(result, string);
    });
  });

  group('padRight ', () {
    String string;
    setUpAll(() {
      string = 'woolha';
    });
    test('default. Padding is space', () {
      final result = string.padRight(10);
      expect(result.endsWith(' '), isTrue);
      expect(result.startsWith(string), isTrue);
      expect(result.substring(string.length - 1, string.length + 4), 'a    ');
      expect(result, 'woolha    ');
    });
    test('default. Padding is dot', () {
      final result = string.padRight(10, '.');
      expect(result.endsWith('.'), isTrue);
      expect(result.startsWith(string), isTrue);
      expect(result.substring(string.length - 1, string.length + 4), 'a....');
      expect(result, 'woolha....');
    });
    test('default. Padding is .,', () {
      final result = string.padRight(10, '.,');
      expect(result.endsWith('.,'), isTrue);
      expect(result.startsWith(string), isTrue);
      expect(
          result.substring(string.length - 1, string.length + 8), 'a.,.,.,.,');
      expect(result, 'woolha.,.,.,.,');
    });
    test('no padding', () {
      final result = string.padRight(3, '.');
      expect(result.startsWith(string), isTrue);
      expect(result.endsWith(string), isTrue);
      expect(result, string);
    });
  });

  test('null-aware', () {
    String x;
    expect(x?.padLeft(10, '.'), isNull);
  });
}
