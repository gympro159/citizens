import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/Config.dart';

// Future<void> callApi(String endpoint,
//     [String method = 'GET',
//     Map<String, dynamic> body,
//     Map<String, String> header]) async {
//   var url = API_URL;
// }

Future callApi(String endpoint,
    [String method = 'GET',
    Map<String, String> header,
    Map<String, dynamic> body]) async {
  final url = "$API_URL/$endpoint";

  List data;
  var response;
  // var response;
  print(111111111111);
  switch (method) {
    case 'GET':
      print('object');
      response = await http.get(url, headers: header);
      print(response.body);
      break;
    case 'DELETE':
      response = await http.delete(url, headers: header);
      break;
    case 'POST':
      response = await http.post(url, headers: header, body: body);
      break;
    case 'PUT':
      response = await http.put(url, headers: header, body: body);
      break;
    default:
      break;
  }
  print(222222222222222);
  if (response.statusCode == 200) {
    print(333333333333);
    var jsonResponse = jsonDecode(response.body);
    data = jsonResponse.toList;
    print('Response status: ${response.statusCode}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return data;
}
