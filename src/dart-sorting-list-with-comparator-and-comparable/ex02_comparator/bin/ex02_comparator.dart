void main() {
  final strings = ['woolha', 'dota', 'com'];
  strings.sort((a, b) => a.length.compareTo(b.length));
  print(strings);
}
