import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

void main() {
  List<List<int>> bytesChunks;
  bytesChunks = [utf8.encode('woolha'), utf8.encode('dot'), utf8.encode('com')];

  var key = utf8.encode('password1234');
  var output = AccumulatorSink<Digest>();
  var hmacSha512 = Hmac(sha512, key);

  ByteConversionSink input;
  input = hmacSha512.startChunkedConversion(output);

  bytesChunks.forEach((List bytes) {
    input.add(bytes);
  });

  input.close();
  Digest result;
  result = output.events.single;
  print('Result: $result');
}
