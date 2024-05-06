import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> addJournal(Map<String, String> data,
    [File? file]) async {
  var uri = Uri.parse('http://api_url/add_journal/');
  var request = http.MultipartRequest('POST', uri)
    ..fields.addAll(data)
    ..headers.addAll({
      'Content-Type': 'multipart/form-data',
    });

  if (file != null) {
    request.files
        .add(await http.MultipartFile.fromPath('uploadFile', file.path));
  }

  var response = await request.send();

  if (response.statusCode == 200) {
    return json.decode(await response.stream.bytesToString());
  } else {
    throw Exception('Failed to add journal');
  }
}

Future<Map<String, dynamic>> getJournalEntries(String userId) async {
  final response = await http.get(
    Uri.parse('http://api_url/get_journal_entries/?user_id=$userId'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch journal entries');
  }
}
