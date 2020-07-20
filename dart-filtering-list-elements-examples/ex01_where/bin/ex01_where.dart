void main() {
  {
    List<String> strings;
    strings = ['one', 'two', 'three', 'four', 'five'];
    Iterable<String> iterable;
    var count = 0;
    iterable = strings.where((item) {
      count++;
      return item.length == 3;
    });
    print('invoked Iterable count before iterating ($count)');
    print('Start iterating');
    List<String> filteredList;
    filteredList = iterable.toList();
    print('invoked Iterable count after iterating ($count)');
    print('Fintering resulnt is $filteredList');

    // Modify the element and iterate again

    strings.removeAt(0);
    List<String> filteredList2;
    filteredList2 = iterable.toList();
    print('Fintering resulnt after removing one item is $filteredList2');
  }
  {
    List<dynamic> elements;
    elements = ['one', 'two', 'three', 'four', 'five', 1];
    Iterable<String> filteredString;
    filteredString = elements.whereType();
    List filteredList;
    filteredList = filteredString.toList();

    print('filteredList (String): $filteredList');

    Iterable<int> filteredInt;
    filteredInt = elements.whereType();
    filteredList = filteredInt.toList();
    print('filteredList (int): $filteredList');
  }
}
