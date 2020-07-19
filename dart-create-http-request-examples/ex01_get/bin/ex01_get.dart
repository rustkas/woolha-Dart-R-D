import 'dart:collection';
import 'package:http/http.dart' as http;

void main() async {
  final url = 'https://jsonplaceholder.typicode.com/todos/1';
  Map<String, String> headers = HashMap();
  headers.putIfAbsent('Accept', () => 'application/json');

  final response = await http.get(
    url,
    headers: headers,
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
