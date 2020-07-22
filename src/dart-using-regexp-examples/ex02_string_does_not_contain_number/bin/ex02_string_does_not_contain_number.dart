void main() {
  final str1 = 'abcde';
  final str2 = 'abc1';
  final re = RegExp(r'^\D+$');
  print('Match str1: ${re.hasMatch(str1)}');
  print('Match str2: ${re.hasMatch(str2)}');
}
