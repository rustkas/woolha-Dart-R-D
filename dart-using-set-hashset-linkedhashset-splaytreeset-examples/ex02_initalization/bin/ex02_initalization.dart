import 'dart:collection' show HashSet, LinkedHashSet, SplayTreeSet;

void main() {
  HashSet set1;
  LinkedHashSet set2;
  SplayTreeSet set3;

  set1 = HashSet<int>();
  set2 = <int>{} as LinkedHashSet<int>;
  set3 = SplayTreeSet<int>();

  final list = [set1, set2, set3];

  // it is not possible using assert into forEach function
  // list.forEach((element) => assert(element is Set));

  for (var item in list) {
    assert(item is Set);
  }

  assert(set1 is HashSet);
  assert(set1 is HashSet<dynamic>);
  assert(set1 is HashSet<int>);
  assert(set1 is HashSet<Object>);
  assert(set1 is! HashSet<String>);

  assert(set2 is LinkedHashSet);
  assert(set2 is LinkedHashSet<dynamic>);
  assert(set2 is LinkedHashSet<int>);
  assert(set2 is LinkedHashSet<Object>);
  assert(set2 is LinkedHashSet<int>);
  
  assert(set3 is SplayTreeSet);
  assert(set3 is SplayTreeSet<dynamic>);
  assert(set3 is SplayTreeSet<int>);
  assert(set3 is SplayTreeSet<Object>);
  assert(set3 is! SplayTreeSet<String>);
}
