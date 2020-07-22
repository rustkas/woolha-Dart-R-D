import 'dart:collection' show HashMap, LinkedHashMap, SplayTreeMap;

void main() {
  HashMap map1;
  LinkedHashMap map2;
  SplayTreeMap map3;

  map1 = HashMap<int, String>();
  map2 = <int, String>{} as LinkedHashMap<int, String>;
  map3 = SplayTreeMap<int, String>();

  final list = [map1, map2, map3];

  for (var item in list) {
    assert(item.isEmpty);
    item[1] = 'A';
    assert(item.isNotEmpty);
    assert(item.containsKey(1));
    assert(item.containsValue('A'));
    assert(item.cast<int, String>() is Map<int, String>);
    assert(item.entries.single.key == 1);
    assert(item.entries.single.value == 'A');
    assert(item[1] == 'A');
    item.clear();
    assert(item.isEmpty);

    for (var i = 0; i < 3; i++) {
      item.putIfAbsent(1, () => 'A');
      assert(item.isNotEmpty);
      assert(item.containsKey(1));
      assert(item.containsValue('A'));
      assert(item.entries.single.key == 1);
      assert(item.entries.single.value == 'A');
      item.update(1, (value) => 'B');
      assert(item.containsKey(1));
      assert(item.containsValue('B'));
      assert(item.entries.single.key == 1);
      assert(item.entries.single.value == 'B');
      assert(item[1] == 'B');
      item.clear();

      item.update(1, (value) => 'B', ifAbsent: () => 'A');
      assert(item.isNotEmpty);
      assert(item.length == 1);
      assert(item.containsKey(1));
      assert(item.containsValue('A'));
      assert(item.entries.single.key == 1);
      assert(item.entries.single.value == 'A');
      assert(item[1] == 'A');
      item.clear();

      assert(item.update(1, (value) => 'B', ifAbsent: () => 'A') == 'A');
      assert(item.update(2, (value) => 'A', ifAbsent: () => 'B') == 'B');
      assert(item.length == 2);
      item[3] == 'C';
      assert(item.length == 2);
      item.addEntries({3: 'C'}.entries);
      assert(item.length == 3);
      assert(item.keys.contains(3));
      item.remove(1);
      assert(item.length == 2);
      assert(!item.keys.contains(1));

      assert(item.keys.contains(2));
      item.removeWhere((key, value) => key % 2 == 0 || value == 'B');
      assert(item.length == 1);
      assert(item[3] == 'C');
      assert(item[1] == null);
      assert(item[2] == null);
  
      item.clear();
    }
  }
}
