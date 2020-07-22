import 'dart:async';

Future<void> main() async {
  await doSomething()
      .then(processResult)
      .catchError(handleError)
      .whenComplete(() {
    print('Finish');
  });
}

Future<void> doSomething() async {
  throw TimeoutException('Timeout');
}

void processResult(result) {
  print('Result: $result');
}

void handleTimeoutError(e) {
  print('TimeoutException: ${e.toString()}');
}

void handleError(e) {
  print('Error: ${e.toString()}');
}
