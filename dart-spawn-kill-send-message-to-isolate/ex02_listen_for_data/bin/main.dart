import 'dart:convert' show Utf8Decoder;
import 'dart:io' show exit, HttpClient, stdin;
import 'dart:isolate' show Isolate, SendPort, ReceivePort;

List<Isolate> isolates;

void main() async {
  await start();
  await stdin.first;
  stop();
  exit(0);
}

void start() async {
  isolates = [];
  final receivePort = ReceivePort();
  isolates.add(await Isolate.spawn(runSomething, receivePort.sendPort));
  isolates.add(await Isolate.spawn(runSomething, receivePort.sendPort));
  isolates.add(await Isolate.spawn(runSomething, receivePort.sendPort));

  receivePort.listen((data) {
    print('Data: $data');
  });
}

void runSomething(SendPort sendPort) async {
  var request =
      await HttpClient().getUrl(Uri.parse('https://swapi.co/api/people/1'));

  var response = await request.close();

  await for (var contents in response.transform(Utf8Decoder())) {
    sendPort.send(contents);
  }
  print('Press enter to exit');
}

void stop() {
  for (var i in isolates) {
    if (i != null) {
      i.kill(priority: Isolate.immediate);
      i = null;
      print('Killed');
    }
  }
}
