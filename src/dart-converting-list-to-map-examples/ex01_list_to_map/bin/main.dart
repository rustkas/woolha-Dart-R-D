import 'dart:mirrors' as mirrors
    show VariableMirror, MirrorSystem, reflectClass, reflect;
void main() {
  Item item1;
  Item item2;
  Item item3;
  Item item4;
  List<Item> items;
  Map<int, String> result;

  item1 = Item(id: 1, name: 'Item one', quantity: 1);
  item2 = Item(id: 2, name: 'Item two', quantity: 2);
  item3 = Item(id: 3, name: 'Item three', quantity: 3);
  item4 = Item(id: 1, name: 'Item four', quantity: 4);
  items = [item1, item2, item3, item4];

  {
    result =
        // ignore: prefer_for_elements_to_map_fromiterable
        Map.fromIterable(items, key: (v) => v.id, value: (v) => v.name);
    print(result);
  }

  {
    result = {for (var v in items) v.id: v.name};
    print(result);
  }
  {
    Map<int, Item> result;
    result = {};
    for (var item in items) {
      result.putIfAbsent(item.id, () => item);
    }

    result.forEach((id, item) {
      print('$id: ${item.name} - ${item.quantity}');
    });
  }

  {
    Map<int, Item> result;
    result = {};

    for (var item in items) {
      int key;
      key = item.id;

      if (!result.containsKey(key)) {
        result[key] = item;
      } else {
        Item existingValue;
        existingValue = result[key];
        existingValue.quantity += item.quantity;
      }
    }

    result.forEach((id, item) {
      // print('$id: ${item.name} - ${item.quantity}');
      print('$id: $item');
    });
    //print(result);
    // print(result[1]);
  }
}

class Item {
  int id;
  String name;
  int quantity;

  Item({this.id, this.name, this.quantity});

  final _itemClass = mirrors.reflectClass(Item);

  @override
  String toString() {
    final fieldMap = <String, dynamic>{};
    final thisInstance = mirrors.reflect(this);
    _itemClass.declarations.forEach((key, value) {
      if (value is mirrors.VariableMirror) {
        final newKey = mirrors.MirrorSystem.getName(key);
        if (!newKey.startsWith('_')) {
          fieldMap[newKey] = thisInstance.getField(key).reflectee;
        }
      }
    });

    return fieldMap.toString();
  }
}
