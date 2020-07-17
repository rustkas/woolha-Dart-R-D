import 'dart:convert' show Utf8Decoder;
import 'dart:io' show exit, HttpClient, stdin;
import 'dart:isolate' show Isolate, SendPort, ReceivePort;

List<Isolate> isolates;

class CustomObject {
  String message;
  SendPort sendPort;
  CustomObject(this.message, this.sendPort);
}

void start() async {
  isolates = [];

  final receivePort = ReceivePort();
  final sendPort = receivePort.sendPort;
  final object1 = CustomObject('1', sendPort);
  final object2 = CustomObject('2', sendPort);
  final object3 = CustomObject('3', sendPort);

  isolates.add(await Isolate.spawn(runSomething, object1));
  isolates.add(await Isolate.spawn(runSomething, object2));
  isolates.add(await Isolate.spawn(runSomething, object3));
  receivePort.listen((data) {
    print('Data: $data');
  });
}

void runSomething(CustomObject object) async {
  print('https://swapi.co/api/people/${object.message}');
  final request = await HttpClient()
      .getUrl(Uri.parse('https://swapi.co/api/people/${object.message}'));
  final response = await request.close();
  final sendPort = object.sendPort;
  await for (var contents in response.transform(Utf8Decoder())) {
    sendPort.send(contents);
  }
  print('Press enter to exit');
}

void stop() {
  for (var item in isolates) {
    item?.kill(priority: Isolate.immediate);
    item = null;
    print('Killed');
  }
}

void main() async {
  await start();
  await stdin.first;
  stop();
  exit(0);
}
