import 'dart:collection';

void main() {
  HashMap map1 = HashMap<int, String>();
  LinkedHashMap map2 = LinkedHashMap<int, String>();
  SplayTreeMap map3 = SplayTreeMap<int, String>();

  final list = [map1, map2, map3];
  for (var item in list) {
    item[1] = 'A';
    assert(item[1] == 'A');

    item.putIfAbsent(1, () => 'A2');
    assert(item[1] == 'A');
    item.putIfAbsent(2, () => 'B');
    assert(item[2] == 'B');
    assert(item.length == 2);
    item.update(1, (e) => '${e}A', ifAbsent: () => 'A');
    assert(item[1] == 'AA');
    item.update(3, (e) => '${e}C', ifAbsent: () => 'C');
    assert(item.length == 3);
    assert(item[3] == 'C');
    assert(item.containsKey(2));
    item.remove(2);
    assert(item.length == 2);
    assert(item[2] == null);
    assert(1 % 2 != 0);
    assert(3 % 2 != 0);
    assert(item[3] == 'C');
    item.removeWhere((key, value) => key % 2 == 0 || value == 'C');
    assert(item.length == 1);
    assert(item[3] == null);
    item[4] = 'D';
    item[5] = 'E';
    item.forEach((key, value) {
     // print('key: $key, value: $value');
    });
    var mappedHashMap = item.map((key, value) {
      return MapEntry(key, '$value mapped');
    });
    assert(mappedHashMap is Map);
    assert(mappedHashMap.length == 3);
    item.clear();
    assert(item.isEmpty);
  }
}
