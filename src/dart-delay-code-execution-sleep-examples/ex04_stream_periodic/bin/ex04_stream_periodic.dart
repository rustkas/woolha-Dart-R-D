void main() {
  var count = 0;
  final myStream = Stream.periodic(Duration(seconds: 10), (_) => count++);
  myStream
      .map((val) {
        print('$val: ${DateTime.now()}');
        return val;
      })
      .take(100)
      .forEach((e) {
        print(e);
      });
}
