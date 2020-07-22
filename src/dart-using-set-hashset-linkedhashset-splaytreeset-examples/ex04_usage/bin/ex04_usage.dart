import 'dart:collection' show HashSet, LinkedHashSet, SplayTreeSet;

void main() {
  HashSet set1 = HashSet<String>();
  LinkedHashSet set2 = <String>{} as LinkedHashSet<String>;
  SplayTreeSet set3 = SplayTreeSet<String>();

  final list = [set1, set2, set3];

  for (var item in list) {
    assert(item is Set);
    item.add('A');
    item.add('B');
    item.add('C');
    item.add('D');
    item.add('E');
    assert(item.elementAt(2) == 'C');
    assert(item.first == 'A');
    
    assert(item.length == 5);
    item.add('A');
    assert(item.length == 5);
    assert(item.contains('A'));
    assert(item.any((element) => element != 'D'));
    item.remove('B');
    assert(item.length == 4);
    item.removeWhere((value) => value == 'A' || value == 'C');
    assert(item.length == 2);

    final newItem = {'E', 'F'};
    final intersection = item.intersection(newItem);
    assert(intersection.length == 1);
    assert(intersection.elementAt(0) == 'E');
    final difference = item.difference(newItem);
    assert(difference.length == 1);
    assert(difference.elementAt(0) == 'D');
  }
}
