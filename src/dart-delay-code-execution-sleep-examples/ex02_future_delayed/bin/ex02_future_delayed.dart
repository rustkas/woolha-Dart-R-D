Future<void> main() async {
  print(DateTime.now());
  await Future.delayed(const Duration(seconds: 10));
  print(DateTime.now()); // This will be printed 10 seconds later.
}
