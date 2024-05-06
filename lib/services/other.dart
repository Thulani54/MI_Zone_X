import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../Constants/constants.dart';

Future<void> addMemory(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse('${Constants.baseUrl}/add_memory/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print('Memory added successfully');
  } else {
    print('Failed to add memory');
  }
}

Future<void> getSharedMemory() async {
  final response =
      await http.get(Uri.parse('${Constants.baseUrl}/get_share_memory/'));

  if (response.statusCode == 200) {
    print('Shared memory fetched successfully');
  } else {
    print('Failed to fetch shared memory');
  }
}

Future<void> addThemeAndSong(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse('${Constants.baseUrl}/add_theme_and_song/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    print('Theme and song added successfully');
  } else {
    print('Failed to add theme and song');
  }
}

Future<void> addBiography(Map<String, String> data, File? file) async {
  var uri = Uri.parse('${Constants.baseUrl}/add_biography/');
  var request = http.MultipartRequest('POST', uri)..fields.addAll(data);

  if (file != null) {
    request.files.add(await http.MultipartFile.fromPath(
      'uploadFile',
      file.path,
    ));
  }

  var response = await request.send();

  if (response.statusCode == 200) {
    print('Biography added successfully');
  } else {
    print('Failed to add biography');
  }
}

Future<Map<String, dynamic>> getFriends(String appUserId) async {
  final response = await http.get(
    Uri.parse('${Constants.baseUrl}/get_friends/?app_user_id=$appUserId'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch friends');
  }
}

Future<Map<String, dynamic>> getAllAppUsers(String appUserId) async {
  final response = await http.get(
    Uri.parse('${Constants.baseUrl}/get_all_app_users/?app_user_id=$appUserId'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch all app users');
  }
}

Future<Map<String, dynamic>> createFamilyTree(
    Map<String, String> data, File? file) async {
  var uri = Uri.parse('${Constants.baseUrl}/create_family_tree/');
  var request = http.MultipartRequest('POST', uri)..fields.addAll(data);

  if (file != null) {
    request.files
        .add(await http.MultipartFile.fromPath('uploadFile', file.path));
  }

  var response = await request.send();

  if (response.statusCode == 200) {
    final respStr = await response.stream.bytesToString();
    return json.decode(respStr);
  } else {
    throw Exception('Failed to create family tree');
  }
}

Future<Map<String, dynamic>> getFamilyTree(String appUserId) async {
  final response = await http.get(
    Uri.parse('${Constants.baseUrl}/get_family_tree/?app_user_id=$appUserId'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch family tree');
  }
}

Future<Map<String, dynamic>> addTreeName(Map<String, String> data) async {
  final response = await http.post(
    Uri.parse('${Constants.baseUrl}/add_tree_name/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to add tree name');
  }
}

Future<Map<String, dynamic>> getTreeNames(String appUserId) async {
  final response = await http.get(
    Uri.parse('${Constants.baseUrl}/get_tree_names/?app_user_id=$appUserId'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch tree names');
  }
}

Future<Map<String, dynamic>> addLegend(
    Map<String, String> data, File? file) async {
  var uri = Uri.parse('${Constants.baseUrl}/add_legend/');
  var request = http.MultipartRequest('POST', uri)..fields.addAll(data);

  if (file != null) {
    request.files
        .add(await http.MultipartFile.fromPath('uploadFile', file.path));
  }

  var response = await request.send();

  if (response.statusCode == 200) {
    final respStr = await response.stream.bytesToString();
    return json.decode(respStr);
  } else {
    throw Exception('Failed to add legend');
  }
}

Future<Map<String, dynamic>> getLegends(String appUserId) async {
  final response = await http.get(
    Uri.parse('${Constants.baseUrl}/get_legends/?app_user_id=$appUserId'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch legends');
  }
}

Future<Map<String, dynamic>> addMessageToLegend(
    Map<String, String> data) async {
  final response = await http.post(
    Uri.parse('${Constants.baseUrl}/add_message_to_legend/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to add message to legend');
  }
}

Future<Map<String, dynamic>> addVoteForLegend(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse('${Constants.baseUrl}/add_vote_for_legend/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to add vote for legend');
  }
}

Future<Map<String, dynamic>> getLegendsMessages(
    String appUserId, String legendId) async {
  final response = await http.get(
    Uri.parse(
        '${Constants.baseUrl}/get_legends_messages/?app_user_id=$appUserId&legend_id=$legendId'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch legends messages');
  }
}

Future<Map<String, dynamic>> addFuneralDetails(
    Map<String, String> data, File? file) async {
  var uri = Uri.parse('${Constants.baseUrl}/add_funeral_details/');
  var request = http.MultipartRequest('POST', uri)..fields.addAll(data);

  if (file != null) {
    request.files
        .add(await http.MultipartFile.fromPath('uploadFile', file.path));
  }

  var response = await request.send();

  if (response.statusCode == 200) {
    final respStr = await response.stream.bytesToString();
    return json.decode(respStr);
  } else {
    throw Exception('Failed to add funeral details');
  }
}

Future<Map<String, dynamic>> getFuneralDetails(String appUserId) async {
  final response = await http.get(
    Uri.parse(
        '${Constants.baseUrl}/get_funeral_details/?app_user_id=$appUserId'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch funeral details');
  }
}

Future<Map<String, dynamic>> uploadEduVid(
    Map<String, String> data, File? file) async {
  var uri = Uri.parse('${Constants.baseUrl}/upload_edu_vid/');
  var request = http.MultipartRequest('POST', uri)..fields.addAll(data);

  if (file != null) {
    request.files
        .add(await http.MultipartFile.fromPath('uploadFile', file.path));
  }

  var response = await request.send();

  if (response.statusCode == 200) {
    final respStr = await response.stream.bytesToString();
    return json.decode(respStr);
  } else {
    throw Exception('Failed to upload educational video');
  }
}

Future<Map<String, dynamic>> getEduVid([String? category]) async {
  final uri = category != null
      ? Uri.parse('${Constants.baseUrl}/get_edu_vid/?category=$category')
      : Uri.parse('${Constants.baseUrl}/get_edu_vid/');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch educational videos');
  }
}
