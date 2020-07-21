void main() {
  print('   woolha dot com'.trim()); // Output: 'woolha dot com'
  print('woolha dot com     '.trim()); // Output: 'woolha dot com'
  print('   woolha dot com     '.trim()); // Output: 'woolha dot com'
  print('   woolha dot com     '.trimLeft()); // Output: 'woolha dot com     '
  print('   woolha dot com     '.trimRight()); // Output:'   woolha dot com'
}
