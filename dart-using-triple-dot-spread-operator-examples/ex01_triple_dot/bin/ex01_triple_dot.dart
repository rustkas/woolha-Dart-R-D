void main() async {
  print('List:');
  {
    List<int> l1;
    l1 = [1, 2, 3];
    List<int> result;
    result = [0, ...l1];
    print(result);
  }
  {
    List<int> l1;
    l1 = [1, 2, 3];
    List<int> l2;
    l2 = [4, 5];
    List<int> result;
    result = [...l1, ...l2];
    print(result);
  }
  {
    List<int> l1;
    l1 = [1, 2, 3];
    List<int> l2;
    l2 = [4, 5];
    List<int> result;
    result = [
      ...[0, ...l1, ...l2],
      6
    ];

    print(result);
  }
  {
    List<int> l1;
    l1 = [1, 2, 3];

    List<int> nullList;
    List<int> result;
    try {
      result = [...l1, ...nullList];
    } on NoSuchMethodError {
      print("NoSuchMethodError: The getter 'iterator' was called on null.");
    }
    print(result);
  }
  {
    List<int> l1;
    l1 = [1, 2, 3];
    List<int> nullList;
    List<int> result;
    result = [...l1, ...?nullList];
    print(result);
  }
  {
    bool condition;
    condition = false;
    final l1 = [1, 2, 3];
    final l2 = [4, 5];
    List<int> result;
    result = [...l1, if (condition) ...l2];

    print(result);
  }
  print('------------------');
  print('Set:');
  {
    Set<int> s1;
    s1 = {1, 2, 3};
    Set<int> s2;
    s2 = {3, 4, 5};
    Set<int> result;
    result = {...s1, ...s2};

    print(result);
  }
  {
    final s1 = {1, 2, 3};
    final s2 = {3, 4, 5};
    final result = {
      ...{...s1, ...s2},
      5,
      6
    };
    print(result);
  }
  {
    Set<int> s1;
    s1 = {1, 2, 3};

    Set<int> nullSet;
    Set<int> result;
    try {
      result = {...s1, ...nullSet};
    } on NoSuchMethodError {
      print(" NoSuchMethodError: The getter 'iterator' was called on null");
    }
    print(result);
  }
  {
    final s1 = {1, 2, 3};
    Set<int> nullSet;
    final result = {...s1, ...?nullSet};
    print(result);
  }
  {
    final s1 = {1, 2, 3};
    final s2 = {3, 4, 5};
    bool condition;
    condition = false;
    final result = {...s1, if (condition) ...s2};

    print(result);
  }
  {
    Future<Set<int>> s1;
    s1 = Future.value({1, 2, 3});
    Future<Set<int>> s2;
    s2 = Future.value({3, 4, 5});
    Set<int> result;
    result = {...await s1, ...await s2};

    print(result);
  }
  await usingFuture();

  print('------------------');
  print('Map:');

  {
    Map<int, String> m1;
    Map<int, String> m2;
    m1 = {1: '1-1', 2: '1-2'};
    m2 = {2: '2-2', 3: '2-3'};
    Map<int, String> result;
    result = {...m1, ...m2};

    print(result);
  }
  {
    final m1 = {1: '1-1', 2: '1-2'};
    final m2 = {2: '2-2', 3: '2-3'};
    final result = {
      ...{...m1, ...m2},
      3: '3',
      4: '4'
    };
    print(result);
  }

  {
    final m1 = {1: '1-1', 2: '1-2'};
    Map<int, String> nullMap;
    Map<int, String> result;
    try {
      result = {...m1, ...nullMap};
    } on NoSuchMethodError {
      print("NoSuchMethodError: The getter 'entries' was called on null.");
    }
    print(result);
  }
  {
    Map<int, String> m1;
    m1 = {1: '1-1', 2: '1-2'};
    Map<int, String> nullMap;
    Map<int, String> result;
    result = {...m1, ...?nullMap};

    print(result);
  }
  {
    Future<Map<int, int>> future1;
    future1 = Future.value({1: 1, 2: 2});
    Future<Map<int, int>> future2;
    future2 = Future.value({3: 3});
    Map<int, int> result;
    result = {...await future1, ...await future2};
    print(result);
  }
}

void usingFuture() async {
  Future<Set<int>> s1;
  s1 = Future.value({1, 2, 3});
  Future<Set<int>> s2;
  s2 = Future.value({3, 4, 5});
  Set<int> result;
  result = {...await s1, ...await s2};

  print(result);
}
