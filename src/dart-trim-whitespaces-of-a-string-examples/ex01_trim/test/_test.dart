import 'package:test/test.dart';

void main() {
  group('trim ', () {
    String string;
    String spaces;
    setUpAll(() {
      string = 'woolha dot com';
      spaces = ' ' * 5;
    });
    test('left', () {
      expect((spaces + string).trim(), string);
    });
    test('right', () {
      expect((string + spaces).trim(), string);
    });
    test('left right', () {
      expect((spaces + string + spaces).trim(), string);
    });
  });
  group('trimLeft ', () {
    String string;
    String spaces;
    setUpAll(() {
      string = 'woolha dot com';
      spaces = ' ' * 5;
    });
    test('left', () {
      expect(spaces.length, 5);
      expect(spaces + string, '     woolha dot com');
      expect((spaces + string).trimLeft(), string);
    });
    test('right', () {
      expect((string + spaces).trimLeft(), string + spaces);
    });
    test('left right', () {
      expect((spaces + string + spaces).trimLeft(), string + spaces);
    });
  });

  group('trimRight ', () {
    String string;
    String spaces;
    setUpAll(() {
      string = 'woolha dot com';
      spaces = ' ' * 5;
    });
    test('left', () {
      expect((spaces + string).trimRight(), spaces + string);
    });
    test('right', () {
      expect((string + spaces).trimRight(), string);
    });
    test('left right', () {
      expect((spaces + string + spaces).trimRight(), spaces + string);
    });
  });

  test('null-aware', () {
    String s;
    expect(s?.trim(), isNull);
  });

  group('Check list of trimmed characters ', () {
    List<int> list;

    setUp(() {
      list = [];
      // Other, Control (Cc)
      // <control-0009>..<control-000D>
      for (var i = int.parse('0009', radix: 16);
          i <= int.parse('000D', radix: 16);
          i++) {
        list.add(i);
      }

      // Separator, Space (Zs)
      // SPACE
      list.add(int.parse('0020', radix: 16));

      // Other, Control (Cc)
      // <control-0085>
      list.add(int.parse('0085', radix: 16));

      // Separator, Space (Zs)
      // NO-BREAK SPACE
      list.add(int.parse('00A0', radix: 16));

      // Separator, Space (Zs)
      // OGHAM SPACE MARK
      list.add(int.parse('1680', radix: 16));

      // Separator, Space (Zs)
      // EN QUAD..HAIR SPACE
      for (var i = int.parse('2000', radix: 16);
          i <= int.parse('200A', radix: 16);
          i++) {
        list.add(i);
      }

      // Separator, Line (Zl)
      // LINE SEPARATOR
      list.add(int.parse('2028', radix: 16));

      // Separator, Paragraph (Zp)
      // PARAGRAPH SEPARATOR
      list.add(int.parse('2029', radix: 16));

      // Separator, Space (Zs)
      // NARROW NO-BREAK SPACE
      list.add(int.parse('202F', radix: 16));

      // Separator, Space (Zs)
      // MEDIUM MATHEMATICAL SPACE
      list.add(int.parse('205F', radix: 16));

      // Separator, Space (Zs)
      // IDEOGRAPHIC SPACE
      list.add(int.parse('3000', radix: 16));

      // BOM
      // ZERO WIDTH NO_BREAK SPACE
      list.add(int.parse('FEFF', radix: 16));
    });

    test('trim', () {
      final spaceString = String.fromCharCodes(list);
      print(spaceString);
      
      expect(spaceString.trim(), '');
    });
  });
}
