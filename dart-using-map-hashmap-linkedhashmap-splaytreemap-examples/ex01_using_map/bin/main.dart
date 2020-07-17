import 'dart:collection';

void main() {
  final map1 = {'key': 'value'};
  assert(map1 is Map);
  assert(map1.entries is Iterable<MapEntry<String, String>>);
  assert(map1 is LinkedHashMap);
  assert(map1 is! HashMap);
  assert(map1 is! SplayTreeMap);
}
