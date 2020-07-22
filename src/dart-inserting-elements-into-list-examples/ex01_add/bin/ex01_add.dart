void main() {
  {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    strings.add('six');
    print(strings);
  }
  {
    final strings = <String>[];
    strings.add('one');
    print(strings);
  }
  {
    List<String> strings;
    try {
      strings.add('one');
    } on NoSuchMethodError {
      print("NoSuchMethodError: The method 'add' was called on null.");
    }
  }
  {
    List<String> strings;
    strings = ['one', 'two', 'three', 'four', 'five'];
    List<String> newStrings;
    newStrings = ['new-one', 'new-two'];
    strings.addAll(newStrings);
    print(strings);
  }

  {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    final newStrings = <String>{};
    newStrings.add('new-one');
    newStrings.add('new-two');
    strings.addAll(newStrings);
    print(strings);
  }
  {
    final strings = [];
    final newStrings = <String>{'new-one', 'new-two'};
    strings.addAll(newStrings);
    print(strings);
  }
  {
    List<String> strings;
    final newStrings = <String>{'new-one', 'new-two'};
    try {
      strings.addAll(newStrings);
    } catch (e) {
      print(e);
    }
  }
  {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    strings.insert(3, 'new');
    print(strings);
  }
  {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    try {
      strings.insert(6, 'new');
    } on RangeError {
      print('RangeError: Invalid value: Not in range 0..5, inclusive: 6');
    }
  }
  {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    final newStrings = ['new-one', 'new-two'];
    strings.insertAll(3, newStrings);
    print(strings);
  }
  {
    final strings = ['one', 'two', 'three', 'four', 'five'];
    final newStrings = ['new-one', 'new-two'];
    strings.insertAll(strings.length, newStrings);
    print(strings);
  }
  {
    {
      final strings = ['one', 'two', 'three', 'four', 'five'];
      final newStrings = ['new-one', 'new-two'];
      try {
        strings.insertAll(strings.length + 1, newStrings);
      } on RangeError {
        print('Range error. Invalid index');
      }
    }
    {
      List<String> strings;
      strings = ['one', 'two', 'three', 'four', 'five'];
      final string = 'one';
      !strings.contains(string) ?? strings.add(string);
      print(strings);
    }
    {
      // move last item to the start position
      List<String> strings;
      strings = ['one', 'two', 'three', 'four', 'five'];
      final string = 'zero';
      !strings.contains(string) ? strings.add(string) : null;
      strings.insert(0, strings.last);
      strings.removeLast();
      print(strings);
    }
  }
}
