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
  // var response;
  print(111111111111);
  switch (method) {
    case 'GET':
      response = await http.get(url, headers: header);
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
  if (response.statusCode == 200) {
    // var jsonResponse = utf8.decode(response.body);
    // var jsonResponse = jsonDecode(response.body);
    var jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    //data = jsonResponse;
    data = jsonResponse;
    print('Response status: ${response.statusCode}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  return data;
}
