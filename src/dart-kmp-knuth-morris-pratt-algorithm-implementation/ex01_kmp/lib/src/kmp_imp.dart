
List<int> kmp(String text, String pattern) {
  var foundIndexes = <int>[];
  var n = text.length;
  var m = pattern.length;
  var i = 0;
  var j = 0;
  var lps = computeLPS(pattern);
  while (i < n) {
    if (pattern[j] == text[i]) {
      i++;
      j++;
    }

    if (j == m) {
      foundIndexes.add(i - m); // Match
       j = lps[j - 1];
    } else if (i < n && pattern[j] != text[i]) {
      if (j != 0) {
        j = lps[j - 1];
      } else {
        i = i + 1;
      }
    }
  }

  return foundIndexes;
}

List computeLPS(String pattern) {
  final lps = List(pattern.length);

  lps[0] = 0;
  var m = pattern.length;
  var j = 0;
  var i = 1;

  while (i < m) {
    if (pattern[j] == pattern[i]) {
      lps[i] = j + 1;
      i++;
      j++;
    } else if (j > 0) {
      j = lps[j - 1];
    } else {
      // no match
      lps[i] = 0;
      i++;
    }
  }

  return lps;
}