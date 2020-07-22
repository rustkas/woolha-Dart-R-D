void main(List<String> arguments) {
  StringBuffer sb;
  sb = StringBuffer('Website: ');

  sb.write('woolha');
  sb.writeCharCode(46);
  sb.writeln('com');
  sb.write('Tags: ');
  sb.writeAll({'Dart', 'Flutter'}, ',');

  print('length: ${sb.length}');
  print('isEmpty: ${sb.isEmpty}');
  print('isNotEmpty: ${sb.isNotEmpty}');
  print('----------\n${sb.toString()}\n----------');
  print('CLEAR THE BUFFER');

  sb.clear();

  print('length: ${sb.length}');
  print('isEmpty: ${sb.isEmpty}');
  print('isNotEmpty: ${sb.isNotEmpty}');
  print('----------\n${sb.toString()}\n----------');
}
