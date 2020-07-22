import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class Person {
  int id;
  String name;
  Person({this.id, this.name});
}

void main() {
  List<List<int>> bytesChunks;
  bytesChunks = [utf8.encode('woolha'), utf8.encode('dot'), utf8.encode('com')];

  var output = AccumulatorSink<Digest>();
  ByteConversionSink input;
  input = sha512.startChunkedConversion(output);

  bytesChunks.forEach((List<int> bytes) {
    input.add(bytes);
  });

  input.close();
  Digest result;
  result = output.events.single;

  print('Result: $result');
}
