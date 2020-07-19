import 'dart:convert';

void main() {
  final url = 'https://www.woolha.com?a=b&c=d#e';
  final encodedUrl = base64Url.encode(utf8.encode(url));
  print('encoded URL: $encodedUrl');
}
