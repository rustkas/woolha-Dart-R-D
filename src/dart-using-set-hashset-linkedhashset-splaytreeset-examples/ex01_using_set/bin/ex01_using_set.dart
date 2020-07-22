import 'dart:collection';

void main() {
  final set1 = {'key'};
  assert(set1 is Set);
  assert(set1 is LinkedHashSet);
  assert(set1 is! HashSet);
  assert(set1 is! SplayTreeSet);
}
