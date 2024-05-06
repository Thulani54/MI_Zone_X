import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RipAlertService {
  final String apiUrl = 'your_api_endpoint_here';
  String accessToken = '';
  String userId = '';

  // Simulating loading and snackbar/toast messages
  void showLoading() => print('Loading...');
  void hideLoading() => print('Hide loading');
  void presentToast(String message) => print(message);
  void presentToastError(String message) => print('Error: $message');

  RipAlertService() {
    getLoginUserData();
  }

  Future<void> getLoginUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileString = prefs.getString('userProfile') ?? '{}';
    var loginUser = json.decode(userProfileString);
    if (loginUser != null) {
      accessToken = loginUser['id'];
      userId = loginUser['userId'];
    }
  }

  Future<dynamic> addRipAlert(Map<String, dynamic> ripAlertInfo) async {
    getLoginUserData();
    String msg = ripAlertInfo['setAsGurdian'] == true
        ? 'Guardian request sent Successfully'
        : 'Contact added successfully';
    showLoading();

    String url = '$apiUrl/RipAlerts/?access_token=$accessToken';
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: json.encode(ripAlertInfo));
      hideLoading();
      if (response.statusCode == 200) {
        presentToast(msg);
        return json.decode(response.body);
      } else {
        throw Exception('Failed to add RipAlert');
      }
    } catch (e) {
      hideLoading();
      presentToastError('Generic error');
      throw e;
    }
  }

  Future<dynamic> getAllRipAlert() async {
    getLoginUserData();
    showLoading();
    String filterJSON = json.encode({
      'where': {
        'userId': userId,
      },
      'include': ['circle', 'rip-media'],
      'order': 'createdAt DESC',
    });
    String url =
        '$apiUrl/RipAlerts/?access_token=$accessToken&filter=${Uri.encodeComponent(filterJSON)}';

    try {
      var response = await http.get(Uri.parse(url));
      hideLoading();
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to get all RipAlerts');
      }
    } catch (e) {
      hideLoading();
      presentToastError('Generic error');
      throw e;
    }
  }

  Future<dynamic> deleteRipAlert(String ripAlertId) async {
    getLoginUserData();
    showLoading();
    String url = '$apiUrl/RipAlerts/$ripAlertId?access_token=$accessToken';

    try {
      var response = await http.delete(Uri.parse(url));
      hideLoading();
      if (response.statusCode == 200) {
        presentToast('RipAlert deleted successfully');
        return json.decode(response.body);
      } else {
        throw Exception('Failed to delete RipAlert');
      }
    } catch (e) {
      hideLoading();
      presentToastError('Generic error');
      throw e;
    }
  }

  Future<dynamic> ripAlertmsg(String userId, String successMsg) async {
    getLoginUserData();
    String editRipAlertUrl =
        '$apiUrl/RipAlerts/send?userId=$userId&access_token=$accessToken';
    try {
      var response = await http.get(Uri.parse(editRipAlertUrl), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to send RipAlert message');
      }
    } catch (e) {
      presentToastError('Generic error');
      throw e;
    }
  }

  Future<dynamic> ripalertcount(String mobile) async {
    getLoginUserData();
    Map<String, dynamic> filterJSON = {
      'mobileNo': mobile,
      'status': 'pending',
      'setAsGurdian': true,
    };
    String filter = Uri.encodeComponent(json.encode(filterJSON));
    String profileURL = '$apiUrl/RipAlerts/count?where=$filter';

    try {
      var response = await http.get(Uri.parse(profileURL));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to count RipAlerts');
      }
    } catch (e) {
      presentToastError('Generic error');
      throw e;
    }
  }

  // Variables like ripCount and any others should be added here with their correct Dart type.
  int ripCount = 0;
}
