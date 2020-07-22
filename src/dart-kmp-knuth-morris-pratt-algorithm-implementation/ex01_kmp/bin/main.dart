import 'package:ex01_kmp/kmp.dart';

void main() {
  print(kmp('ABCABCDEFGABC', 'ABC')); // Output: [0, 3, 10]
  print(kmp('AAAAAAAAAAAAAAABBCCDDAAA', 'AAAA')); // Output: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
  print(kmp('AAAABBCCDDAAA', 'ABAAB')); // Output: []
}
