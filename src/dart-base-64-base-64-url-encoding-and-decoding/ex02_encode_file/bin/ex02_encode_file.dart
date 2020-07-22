import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  // Write a file with content
  File file;
  try {
    file = File('file.txt');
    if (!file.existsSync()) {
      file.createSync();
    }
    file.writeAsStringSync('abcde');
    List fileBytes = await File('file.txt').readAsBytesSync();

    final encodedFile = base64.encode(fileBytes);
    print('Encoded data : $encodedFile');
  } finally {
    file?.deleteSync();
  }
}
