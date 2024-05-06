import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HelpAlertService {
  final String apiUrl = 'https://api.example.com/';
  String accessToken = '';
  String userId = '';

  HelpAlertService() {
    getLoginUserData();
  }

  void getLoginUserData() {
    // Simulating retrieval of user data
    this.userId = 'someUserId'; // Example data
    this.accessToken = 'someAccessToken'; // Example data
  }

  Future<dynamic> addHelpAlert(
      Map<String, dynamic> helpAlertInfo, String successMsg) async {
    getLoginUserData();
    var headers = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
      'Authorization': 'Bearer $accessToken',
    };

    String url = apiUrl + 'HelpAlerts/';

    try {
      var response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(helpAlertInfo));
      if (response.statusCode == 200) {
        // Success
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error posting help alert: $e');
    }
  }

  Future<dynamic> getHelpAlert(String helpAlertId) async {
    getLoginUserData();
    var headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String url = '$apiUrl' + 'HelpAlerts/$helpAlertId';

    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to get help alert');
      }
    } catch (e) {
      throw Exception('Error retrieving help alert: $e');
    }
  }

  Future<dynamic> getAllHelpAlerts(String userId) async {
    getLoginUserData();
    var headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String filter = jsonEncode({
      'where': {
        'userId': userId,
      },
      'include': ['circle'],
      'order': 'createdAt DESC',
    });

    String url = '$apiUrl' + 'HelpAlerts?filter=$filter';

    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load help alerts');
      }
    } catch (e) {
      throw Exception('Error loading help alerts: $e');
    }
  }

  Future<dynamic> deleteHelpAlert(String helpAlertId) async {
    getLoginUserData();
    var headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String url = '$apiUrl' + 'HelpAlerts/$helpAlertId';

    try {
      var response = await http.delete(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to delete help alert');
      }
    } catch (e) {
      throw Exception('Error deleting help alert: $e');
    }
  }

  Future<dynamic> sendHelpAlertMsg(
      String userId, Map<String, dynamic> position, String successMsg) async {
    String url =
        '$apiUrl' + 'HelpAlerts/send?userId=$userId&access_token=$accessToken';
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(position),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body); // Handle success
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      throw Exception('Error sending help alert message: $e');
    }
  }

  Future<void> deleteHelpAlertsInCircle(String circleId) async {
    try {
      var alerts = await getAllHelpAlertsForCircle(circleId);
      for (var alert in alerts) {
        await deleteHelpAlert(alert['id']);
      }
    } catch (e) {
      print('Error deleting alerts for circle: $e');
    }
  }

  Future<List<dynamic>> getAllHelpAlertsForCircle(String circleId) async {
    String url = '$apiUrl' +
        'HelpAlerts/?access_token=$accessToken&filter=' +
        Uri.encodeComponent(jsonEncode({
          'where': {'circleId': circleId},
        }));
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load help alerts');
      }
    } catch (e) {
      throw Exception('Error retrieving alerts for circle: $e');
    }
  }

  Future<int> countContacts(String userId) async {
    String url = '$apiUrl' +
        'HelpAlerts/count?where=' +
        Uri.encodeComponent(jsonEncode({
          'userId': userId,
        }));
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data[
            'count']; // Assuming the server returns a JSON object with a count field
      } else {
        throw Exception('Failed to count contacts');
      }
    } catch (e) {
      throw Exception('Error counting contacts: $e');
    }
  }
}
