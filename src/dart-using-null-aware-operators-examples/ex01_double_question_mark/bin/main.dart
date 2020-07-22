void main() {
  {
    int func1() {
      return 1;
    }

    int func2() {
      return 2;
    }

    final result = func1() ?? func2();

    print('Result: $result');
  }
  {
    int func1() {
      return null;
    }

    int func2() {
      return 2;
    }

    final result = func1() ?? func2();
    print('Result: $result');
  }
  {
    int value;
    final defaultValue = 1;
    value ??= defaultValue;
    print(value);
  }
  {
    Item item;
    item = Item(name: 'Item one');
    String name;
    name = item?.name;
    print('Name: $name');
  }
  {
    Item item;
    item = Item(name: 'Item one', category: Category(name: 'Cat 1'));
    String name;
    name = item?.category?.name;
    print('Category Name: $name');
  }
  {
    final item = Item(name: 'Item one', category: Category(name: 'Cat 1'));
    final name = item?.category?.name;
    print('Category Name: $name');
  }
  {
    final l1 = [1, 2, 3];
    List<int> l2;
    final l3 = [...l1, ...?l2];
    print(l3);
  }
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
