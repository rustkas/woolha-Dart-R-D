import 'package:ex01_kmp/kmp.dart';
import 'package:test/test.dart';

void main() {
  
  test('ABC', () {
    final list = [0, 3, 10];
    final text = 'ABCABCDEFGABC';
    final pattern = 'ABC';
    expect(kmp(text, pattern), isList);
    expect(kmp(text, pattern).length, list.length);
    for (var element in list) {
      expect(kmp(text, pattern).contains(element), isTrue);
    }
  });

  test('AAAA', () {
    final text = 'AAAABBCCDDAAA';
    final pattern = 'ABAAB';
    expect(kmp(text, pattern), isList);
    expect(kmp(text, pattern).length, 0);
  });

  test('AAAA', () {
    final list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    final text = 'AAAAAAAAAAAAAAABBCCDDAAA';
    final pattern = 'AAAA';
    expect(kmp(text, pattern), isList);
    expect(kmp(text, pattern).length, list.length);
    for (var element in list) {
      expect(kmp(text, pattern).contains(element), isTrue);
    }
  });
}
