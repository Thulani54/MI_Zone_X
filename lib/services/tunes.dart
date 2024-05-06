import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Constants/constants.dart';

Future<Map<String, dynamic>> getTunes() async {
  final response = await http.get(Uri.parse('${Constants.baseUrl}/getTunes/'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch tunes');
  }
}
