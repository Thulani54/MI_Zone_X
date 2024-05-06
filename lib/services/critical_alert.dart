import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CriticalAlertService {
  final String apiUrl = 'YOUR_API_ENDPOINT_HERE'; // Set your API endpoint
  String accessToken = '';
  String userId = '';

  CriticalAlertService() {
    getLoginUserData();
  }

  void getLoginUserData() {
    // Here, you would retrieve user data from local storage or your app's authentication system
    // This is just a placeholder for demo purposes
    accessToken = 'example_access_token';
    userId = 'example_user_id';
  }

  Future<dynamic> addCriticalAlert(
      Map<String, dynamic> criticalAlertInfo) async {
    String url = '$apiUrl/CriticalAlerts/?access_token=$accessToken';
    var response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(criticalAlertInfo));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> getAllCriticalAlert() async {
    String filter = jsonEncode({
      "where": {"userId": userId},
      "include": ["circle"],
      "order": "createdAt DESC",
    });
    String url =
        '$apiUrl/CriticalAlerts/?access_token=$accessToken&filter=$filter';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> editCriticalAlert(
      Map<String, dynamic> criticalAlertInfo, String criticalAlertId) async {
    String url =
        '$apiUrl/CriticalAlerts/$criticalAlertId?access_token=$accessToken';
    var response = await http.patch(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(criticalAlertInfo));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> deleteCriticalAlert(String criticalAlertId) async {
    String url =
        '$apiUrl/CriticalAlerts/$criticalAlertId?access_token=$accessToken';
    var response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to delete data');
    }
  }

  Future<dynamic> criticalAlertMsg(
      Map<String, dynamic> criticalAlertInfo, String userId) async {
    String url =
        '$apiUrl/CriticalAlerts/send?userId=$userId&access_token=$accessToken';
    var response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(criticalAlertInfo));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to send data');
    }
  }
}
