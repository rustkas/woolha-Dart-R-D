import 'dart:async';
import 'dart:collection';
import 'package:http/http.dart' as http;

void main() async {
  final url = 'https://jsonplaceholder.typicode.com/todos/1';
  Map<String, String> headers = HashMap();
  headers.putIfAbsent('Accept', () => 'application/json');

  try {
    final response = await http
        .get(
          url,
          headers: headers,
        )
        .timeout(const Duration(seconds: 1));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  } on TimeoutException catch (_) {
    print('Timeout');
  } on Error catch (e) {
    print('Error: $e');
  }
}
