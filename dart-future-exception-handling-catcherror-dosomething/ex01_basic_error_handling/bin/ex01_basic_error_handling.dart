
Future<void> main() async {
  await doSomething().then(processResult).catchError(handleError);
}

Future<void> doSomething() async {
  throw 'An error';
}

void processResult(result) {
  print('Result: $result');
}

void handleError(e) {
  print('Error: ${e.toString()}');
}