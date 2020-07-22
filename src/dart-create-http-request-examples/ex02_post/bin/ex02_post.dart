import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final url = 'https://jsonplaceholder.typicode.com/posts';
  Map<String, String> headers = HashMap();
  headers['Accept'] = 'application/json';
  headers['Content-type'] = 'application/json';

  final response = await http.post(url,
      headers: headers,
      body: jsonEncode({'name': 'Item One', 'quantity': 1}),
      encoding: Encoding.getByName('utf-8'));
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
