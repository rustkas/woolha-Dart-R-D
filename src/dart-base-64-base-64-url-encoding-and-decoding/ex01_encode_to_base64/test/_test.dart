import 'dart:convert';
import 'package:test/test.dart';

void main() {
  group('base64 ', () {
    var text;

    setUp(() {
      text = 'Hello world';
    });
    test('encoding', () {
      final encodedText = utf8.encode(text);
      final base64Str = base64.encode(encodedText);

      expect(base64Str, 'SGVsbG8gd29ybGQ=');
    });
    test('decoding', () {
      final encodedText = utf8.encode(text);
      final base64Str = base64.encode(encodedText);
      final decodedText = utf8.decode(base64.decode(base64Str));

      expect(decodedText, text);
    });
  });
}
