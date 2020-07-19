void main() {
  final str1 = 'abcde';
  final str2 = 'zzabc';
  final re = RegExp(r'abc');
  final str1Match = re.matchAsPrefix(str1);
  final str2Match = re.matchAsPrefix(str2);
  print('Match str1: ${str1Match != null}');
  print('Match str2: ${str2Match != null}');
}
