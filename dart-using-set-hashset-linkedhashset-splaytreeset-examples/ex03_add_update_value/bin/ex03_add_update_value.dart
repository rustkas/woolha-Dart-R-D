import 'dart:collection' show HashSet, LinkedHashSet, SplayTreeSet;

void main() {
  HashSet set1;
  LinkedHashSet set2;
  SplayTreeSet set3;

  set1 = HashSet<String>();
  set2 = <String>{} as LinkedHashSet<String>;
  set3 = SplayTreeSet<String>();

  final list = [set1, set2, set3];

  // it is not possible using assert into forEach function
  // list.forEach((element) => assert(element is Set));

  for (var item in list) {
    assert(item is Set);
    item.add('A');
    assert(item.isNotEmpty);
    assert(item.contains('A'));
    assert(item.elementAt(0) == 'A');
    assert(item.first == 'A');
    assert(item.last == 'A');
    assert(item.first == item.last);
    assert(item.length == 1);
    assert(item.any((element) => element == 'A'));
    assert(!item.remove('B'));
    assert(item.remove('A'));
    assert(item.isEmpty);
    item.add('AB');
    item.add('BA');
    assert(item.length == 2);
    item.removeWhere((value) =>
        (value is String) && value.startsWith('A') ||
        (value is String) && value.endsWith('A'));
    assert(item.isEmpty);

    item.addAll('A B C D C D A B'.split(' '));
    final newItem = <String>{};
    newItem.addAll('D G C E C F A B'.split(' '));

    final intersection = item.intersection(newItem);
    assert(intersection.containsAll(['A', 'B', 'C', 'D']));

    final difference1 = item.difference(newItem);
    assert(difference1.isEmpty);
    final difference2 = newItem.difference(item);
    assert(difference2.isNotEmpty);
    assert(difference2.containsAll(['G', 'E', 'F']));

    final union = item.union(newItem);
    assert(union.containsAll(item));
    assert(union.containsAll(newItem));

    final newTmpItem = <String>{};
    item.forEach((element) {
      newTmpItem.add(element);
    });
    newTmpItem.clear();
    final mappedSet = item.map((e) => 'mapped $e');
    assert(mappedSet.length == item.length);
    final reduceResult = item.reduce((value, element) => '$value$element');

    assert((reduceResult as String).length == 4);
    assert(item.toList() is List);
    // assert(reduceResult == 'A B C D C D A B');
  }
}
