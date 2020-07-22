void main() {
  print(10.123.toStringAsFixed(0)); // 10
  print(10.1.toStringAsFixed(2)); // 10.10
  print(10.123.toStringAsFixed(2)); // 10.12
  print(10.125.toStringAsFixed(2)); // 10.13
  print(10.129.toStringAsFixed(2)); // 10.13
  print(10.135.toStringAsFixed(2)); // 10.13
  print(10.1201.toStringAsFixed(3)); // 10.120
}
