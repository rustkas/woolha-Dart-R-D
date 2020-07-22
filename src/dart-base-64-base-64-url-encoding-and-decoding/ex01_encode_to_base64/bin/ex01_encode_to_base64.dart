import 'dart:convert';

void main() {
  final text = '1';
  final encodedText = utf8.encode(text);
  final base64Str = base64.encode(encodedText);
  
  print('base64: $base64Str');

  final decodedText = utf8.decode(base64.decode(base64Str));

  print('text: $decodedText');
}
