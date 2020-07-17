import 'dart:collection' show HashMap, LinkedHashMap, SplayTreeMap;

void main() {
  HashMap map1;
  LinkedHashMap map2;
  SplayTreeMap map3;

  map1 = HashMap<int, String>();
  map2 = <int, String>{} as LinkedHashMap<int, String>;
  map3 = SplayTreeMap<int, String>();

  final list = [map1, map2, map3];

  // it is not possible using assert into forEach function
  // list.forEach((element) => assert(element is Map));

  for (var item in list) {
    assert(item is Map);
  }

  assert(map1 is HashMap);
  assert(map1 is HashMap<dynamic, dynamic>);
  assert(map1 is HashMap<int, String>);
  assert(map1 is HashMap<Object, Object>);
  assert(map1 is HashMap<int, Object>);
  assert(map1 is! HashMap<int, int>);

  assert(map2 is LinkedHashMap);
  assert(map2 is LinkedHashMap<dynamic, dynamic>);
  assert(map2 is LinkedHashMap<int, String>);
  assert(map2 is LinkedHashMap<Object, Object>);
  assert(map2 is LinkedHashMap<int, Object>);
  assert(map2 is! LinkedHashMap<int, int>);

  assert(map3 is SplayTreeMap);
  assert(map3 is SplayTreeMap<dynamic, dynamic>);
  assert(map3 is SplayTreeMap<int, String>);
  assert(map3 is SplayTreeMap<Object, Object>);
  assert(map3 is SplayTreeMap<int, Object>);
  assert(map3 is! SplayTreeMap<int, int>);
}
