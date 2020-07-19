import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  group('Encode File to base64 🐻‍❄️ ', () {
    File file;
    String text;
    setUp(() {
      file = File('file.txt');
      if (!file.existsSync()) {
        file.createSync();
        // print('${file.absolute.path}');
      }
      text = 'abcde';
    });
    tearDown(() {
      file?.deleteSync();
    });

    test('encode', () async {
      file.writeAsStringSync(text);
      List fileBytes = await File('file.txt').readAsBytesSync();
      final encodedFile = base64.encode(fileBytes);
      expect(encodedFile, 'YWJjZGU=');
    });
    test('decode', () async {
      file.writeAsStringSync(text);
      List fileBytes = await File('file.txt').readAsBytesSync();
      final encodedFile = base64.encode(fileBytes);
      final decodedFile = utf8.decode(base64.decode(encodedFile));
      expect(decodedFile, text);
    });
  });
}
