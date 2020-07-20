import 'package:test/test.dart';

void main() {
  group('List ', () {
    List<int> l1;
    List<int> l2;
    List<int> result;
    setUpAll(() {
      l1 = [1, 2, 3];
      l2 = [4, 5];
    });
    test('Like addAll', () {
      {
        result = [0, ...l1];
        expect(result, equals([0, 1, 2, 3]));
      }
    });
    test('combining two List instances', () {
      result = [...l1, ...l2];
      expect(result, equals([1, 2, 3, 4, 5]));
    });

    test('Nested assignment', () {
      result = [
        ...[0, ...l1, ...l2],
        6
      ];

      expect(result, equals([0, 1, 2, 3, 4, 5, 6]));
    });
    test('use the spread operator with a null List', () {
      List<int> l1;
      l1 = [1, 2, 3];
      List<int> nullList;
      expect(() => [...l1, ...nullList], throwsA(isNoSuchMethodError));
    });
    test(' null-aware operator for spread', () {
      List<int> nullList;
      List<int> result;
      result = [...l1, ...?nullList];
      expect(result, equals(l1));
    });
    test('using if condition - false', () {
      final condition = false;
      List<int> result;
      result = [...l1, if (condition) ...l2];
      expect(result, equals(l1));
    });
    test('using if condition - true', () {
      final condition = true;
      List<int> result;
      result = [...l1, if (condition) ...l2];
      expect(result, equals([1, 2, 3, 4, 5]));
    });
  });
  group('Set ', () {
    Set<int> s1;
    Set<int> s2;
    Set<int> result;
    setUpAll(() {
      s1 = {1, 2, 3};
      s2 = {3, 4, 5};
    });
    test('combine multiple Set instances', () {
      result = {...s1, ...s2};
      expect(result, equals({1, 2, 3, 4, 5}));
    });
    test('using nested spread operator', () {
      result = {
        ...{...s1, ...s2},
        5,
        6
      };
      expect(result, equals({1, 2, 3, 4, 5, 6}));
    });
    test('add null Set', () {
      Set<int> nullSet;
      expect(() => {...s1, ...nullSet}, throwsA(isNoSuchMethodError));
    });
    test('handled error using null-aware ? notation', () {
      Set<int> nullSet;
      expect({...s1, ...?nullSet}, equals(s1));
    });
    test('using if condition - false', () {
      bool condition;
      condition = false;
      result = {...s1, if (condition) ...s2};
      expect(result, s1);
    });
    test('using if condition - true', () {
      bool condition;
      condition = true;
      result = {...s1, if (condition) ...s2};
      final s1Length = s1.length;
      final s2Length = s2.length;
      expect(result, s1.union(s2));
      expect(s1.length, s1Length);
      expect(s2.length, s2Length);
    });
    test('using Future', () async {
      Future<Set<int>> s1;
      s1 = Future.value({1, 2, 3});
      Future<Set<int>> s2;
      s2 = Future.value({3, 4, 5});
      result = {...await s1, ...await s2};
      expect(result, equals({1, 2, 3, 4, 5}));
    });
  });

  group('Map ', () {
    Map<int, String> m1;
    Map<int, String> m2;
    Map<int, String> result;

    setUpAll(() {
      m1 = {1: '1-1', 2: '1-2'};
      m2 = {2: '2-2', 3: '2-3'};
    });

    test('usage example', () {
      result = {...m1, ...m2};
      expect(result, {1: '1-1', 2: '2-2', 3: '2-3'});
    });
    test('nested spread operator', () {
      result = {
        ...{...m1, ...m2},
        3: '3',
        4: '4'
      };
      expect(result, {1: '1-1', 2: '2-2', 3: '3', 4: '4'});
    });
    test('add null', () {
      Map<int, String> nullMap;
      expect(() => {...m1, ...nullMap}, throwsA(isNoSuchMethodError));
    });
    test('using null-aware operator', () {
      Map<int, String> nullMap;

      result = {...m1, ...?nullMap};
      expect(result, m1);
    });
    test('get value from a Future', () async {
      Future<Map<int, int>> future1;
      future1 = Future.value({1: 1, 2: 2});
      Future<Map<int, int>> future2;
      future2 = Future.value({3: 3});
      Map<int, int> result;
      result = {...await future1, ...await future2};
      expect(result, {1: 1, 2: 2, 3: 3});
    });
  });
}
