import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/Config.dart';

Future callApi(String endpoint,
    [String method = 'GET',
    Map<String, String> header,
    Map<String, dynamic> body]) async {
  final url = "$API_URL/$endpoint";
  List data;
  var response;

  switch (method) {
    case 'GET':
      response = await http.get(url, headers: header);
      break;
    case 'DELETE':
      response = await http.delete(url, headers: header);
      break;
    case 'POST':
      response = await http.post(url, headers: header, body: json.encode(body));
      break;
    case 'PUT':
      response = await http.put(url, headers: header, body: json.encode(body));
      break;
    default:
      break;
  }
  if (response.statusCode == 200) {
    // var jsonResponse = utf8.decode(response.body);
    // var jsonResponse = jsonDecode(response.body);
    if (method == 'GET') {
      var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      data = jsonResponse;
    }
    print('Response status: ${response.statusCode}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return data;
}
