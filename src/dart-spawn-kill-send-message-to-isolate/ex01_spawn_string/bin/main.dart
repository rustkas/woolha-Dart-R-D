import 'dart:convert' show Utf8Decoder;
import 'dart:io' show HttpClient, stderr, stdout, stdin, exit;
import 'dart:isolate' show Isolate;

List<Isolate> isolates;

void main() async {
  await start();
  await stdin.first;
  stop();
  await stderr.flush();
  await stdout.flush();
  exit(0);
}

void start() async {
  isolates = [];
  isolates.add(await Isolate.spawn(runSomething, 'first'));
  isolates.add(await Isolate.spawn(runSomething, 'second'));
  isolates.add(await Isolate.spawn(runSomething, 'third'));
}

void runSomething(String arg) async {
  print('arg: $arg');

  var request =
      await HttpClient().getUrl(Uri.parse('https://swapi.co/api/people/1'));

  var response = await request.close();
  
  await for (var contents in response.transform(Utf8Decoder())) {
    print(contents);
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
