import 'package:test/test.dart';

void main() {
  test('where', () {
    List<String> strings;
    strings = ['one', 'two', 'three', 'four', 'five'];
    Iterable<String> iterable;
    var size = 2;
    iterable = strings.where((item) => item.length == 3);
    List<String> filteredList;
    filteredList = iterable.toList();
    expect(filteredList.length, size);
  });
  test('where. remove', () {
    List<String> strings;
    strings = ['one', 'two', 'three', 'four', 'five'];
    Iterable<String> iterable;
    var size = 2;
    iterable = strings.where((item) => item.length == 3);
    List<String> filteredList;
    filteredList = iterable.toList();

    strings.removeAt(0);
    filteredList = iterable.toList();
    expect(filteredList.length, size - 1);
  });
  group('whereType ', () {
    List<dynamic> elements;
    List filteredList;
    setUp(() {
      elements = ['one', 'two', 'three', 'four', 'five', 1];
    });

    test('String', () {
      Iterable<String> filtered;
      filtered = elements.whereType();
      filteredList = filtered.toList();
      expect(filteredList, equals(['one', 'two', 'three', 'four', 'five']));
    });
    test('int', () {
      Iterable<int> filtered;
      filtered = elements.whereType();
      filteredList = filtered.toList();
      expect(filteredList, equals([1]));
    });
  });
}
