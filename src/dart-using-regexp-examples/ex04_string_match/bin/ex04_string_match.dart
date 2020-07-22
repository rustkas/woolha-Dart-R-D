void main() {
  final str1 = 'abcde qwerty';
  final str2 = 'vwxyz uiop';
  final re = RegExp(r'(\w+)');
  final str1Match = re.stringMatch(str1);
  final str2Match = re.stringMatch(str2);

  print('Match str1: $str1Match');
  print('Match str2: $str2Match');
}
