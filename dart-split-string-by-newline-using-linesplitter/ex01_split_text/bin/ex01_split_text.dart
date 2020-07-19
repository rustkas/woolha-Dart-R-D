import 'dart:convert';

import 'dart:core';

void main() {
  final lines = <String>[];
  var counter = 0;
  lines.add('Line ${counter++}: aaaaa\n');
  lines.add('Line ${counter++}: bbbbb\r\n');
  lines.add('Line ${counter++}: ccccc   \n');
  lines.add('Line ${counter++}: \n');
  lines.add('Line ${counter++}: ddddd \r\n');
  lines.add('Line ${counter++}: \r\n');
  lines.add('Line ${counter++}: eeeee\n');

  final text = lines.join();

  print('---Original---');
  print(text);

  final ls = LineSplitter();
  
  final strings = ls.convert(text);

  print('---Result---');
  for (var i = 0; i < strings.length; i++) {
    print('${strings[i]}');
  }
}
