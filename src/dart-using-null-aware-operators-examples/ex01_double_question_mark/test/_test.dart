import 'package:test/test.dart';

void main() {
  group('Double Questions (??) Mark. Get not null first ', () {
    int func1() {
      return 1;
    }

    int func2() {
      return 2;
    }

    test('result', () {
      final result = func1() ?? func2();
      expect(result, 1);
    });
  });
  group('Double Questions (??) Mark. Get not null second ', () {
    int func1() {
      return null;
    }

    int func2() {
      return 2;
    }

    test('result', () {
      final result = func1() ?? func2();
      expect(result, 2);
    });
  });
  group('Double Questions + Equal (??=) Mark ', () {
    test('init null variable', () {
      int value;
      final defaultValue = 1;
      value ??= defaultValue;
      expect(value, defaultValue);
    });
    test('do not change variable', () {
      int value;
      final defaultValue = 10;
      value = defaultValue;
      value ??= defaultValue;
      expect(value, 10);
    });
  });

  group(' access an attribute or a method only if the object is not null ',
      () {
    test('is not null', () {
      final nameInitValue = 'Item one';
      final item = Item(name: nameInitValue);
      final name = item?.name;
      expect(name, nameInitValue);
    });
    test('is null', () {
      final nameInitValue = 'Item one';
      Item item;
      var name = nameInitValue;
      name = item?.name;
      expect(name, isNull);
    });
    test('do not change variable', () {
      final nameInitValue = 'Item one';
      Item item;
      var name = nameInitValue;
      name ??= item?.name;
      expect(name, nameInitValue);
    });
    test('get Category name', () {
      Item item;
      item = Item(name: 'Item one', category: Category(name: 'Cat 1'));
      String name;
      name = item?.category?.name;
      expect(name, 'Cat 1');
    });
    test('get Category name. Category is null', () {
      Item item;
      item = Item(name: 'Item one');
      String name;
      name = '';
      name = item?.category?.name;
      expect(name, null);
    });
    test('get Category name. Item is null', () {
      Item item;
      String name;
      name = '';
      name = item?.category?.name;
      expect(name, isNull);
    });
  });
  group('Triple Dot + ? ', () {
    List<int> l1;
    List<int> l2;
    List<int> l3;
    setUpAll(() {
      l1 = [1, 2, 3];
    });
    test('save behaviour', () {
      l3 = [...l1, ...?l2];
      expect(l3, l1);
    });
    test('if save behaviour', () {
      l3 = [...l1];
      if (l2 != null) {
        l3.addAll(l2);
      }
      expect(l3, l1);
    });
  });
}

class Category {
  String name;
  Category({this.name});
}

class Item {
  int id;
  String name;
  Category category;
  Item({this.id, this.name, this.category});
}
