import 'package:test/test.dart';

void main() {
  test('add', () {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    final length = strings.length;
    final newString = 'six';
    strings.add(newString);
    expect(strings.length, length + 1);
    expect(strings.last, newString);
    expect(strings, equals(['one', 'two', 'three', 'four', 'five', 'six']));
  });
  test('add to empty list', () {
    final strings = <String>[];
    final newString = 'six';
    strings.add(newString);
    expect(strings.first == strings.last, isTrue);
    expect(strings.first, strings.last);
    expect(strings.first, newString);
    expect(strings.last, newString);
    expect(strings, equals(['six']));
  });
  test('add. throw NoSuchMethodError', () {
    List<String> strings;
    expect(strings, isNull);
    expect(() => strings.add('one'), throwsA(isNoSuchMethodError));
  });
  test('addAll', () {
    List<String> strings;
    strings = ['one', 'two', 'three', 'four', 'five'];
    List<String> newStrings;
    newStrings = ['new-one', 'new-two'];

    final stringsLength = strings.length;
    final newStringsLength = newStrings.length;
    strings.addAll(newStrings);
    expect(strings.length, stringsLength + newStringsLength);
    expect(strings,
        equals(['one', 'two', 'three', 'four', 'five', 'new-one', 'new-two']));
  });
  test('addAll. add Set', () {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    final newStrings = <String>{};
    newStrings.add('new-one');
    newStrings.add('new-two');
    strings.addAll(newStrings);
    expect(strings,
        equals(['one', 'two', 'three', 'four', 'five', 'new-one', 'new-two']));
  });

  test('Applying `.addAll` on an empty List', () {
    final strings = [];
    final newStrings = <String>{'new-one', 'new-two'};
    strings.addAll(newStrings);
    expect(strings, equals(['new-one', 'new-two']));
  });

  test('addAll. throw NoSuchMethodError', () {
    List<String> strings;
    expect(strings, isNull);
    final newStrings = <String>{'new-one', 'new-two'};

    expect(() => strings.addAll(newStrings), throwsA(isNoSuchMethodError));
  });

  test('insert', () {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    strings.insert(3, 'new');
    expect(strings, equals(['one', 'two', 'three', 'new', 'four', 'five']));
  });

  test('insert. throw RangeError', () {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    expect(() => strings.insert(6, 'new'), throwsA(isRangeError));
  });

  test('insert all. index=3', () {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    final newStrings = ['new-one', 'new-two'];
    strings.insertAll(3, newStrings);
    expect(strings,
        equals(['one', 'two', 'three', 'new-one', 'new-two', 'four', 'five']));
  });
  test('insert all to the end', () {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    final newStrings = ['new-one', 'new-two'];
    strings.insertAll(strings.length, newStrings);
    expect(strings,
        equals(['one', 'two', 'three', 'four', 'five', 'new-one', 'new-two']));
  });
  test('insert all. RangeError', () {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    final newStrings = ['new-one', 'new-two'];
    expect(() => strings.insertAll(strings.length + 1, newStrings),
        throwsA(isRangeError));
  });
  test('addAll to an empty list', () {
    final strings = [];
    final newStrings = ['new-one', 'new-two'];
    strings.insertAll(0, newStrings);
    expect(strings, equals(['new-one', 'new-two']));
  });
  test('addAll to an empty list. RangeError', () {
    final strings = [];
    final newStrings = ['new-one', 'new-two'];
    expect(() => strings.insertAll(1, newStrings), throwsA(isRangeError));
  });
  test('addAll to an empty list. NoSuchMethodError', () {
    List<String> strings;
    final newStrings = ['new-one', 'new-two'];
    expect(strings, isNull);
    expect(
        () => strings.insertAll(0, newStrings), throwsA(isNoSuchMethodError));
  });
  test("Inserting an Element only if it doesn't exist. Exist", () {
    List<String> strings;
    strings = ['one', 'two', 'three', 'four', 'five'];
    final string = 'one';
    final length = strings.length;
    !strings.contains(string) ?? strings.add(string);
    expect(strings.length, length);
    expect(string, isIn(strings));
  });
  test("Inserting an Element only if it doesn't exist. Not Exist", () {
    List<String> strings;
    strings = ['one', 'two', 'three', 'four', 'five'];
    final string = 'zero';
    final length = strings.length;
    !strings.contains(string) ? strings.add(string) : null;
    expect(strings.length, length + 1);
    expect(string, isIn(strings));
  });
}
