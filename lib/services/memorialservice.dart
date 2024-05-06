import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MemorialService {
  final String apiUrl = 'your_api_endpoint_here';
  Map<String, String> headers = {};
  String? accessToken;
  dynamic userdata;
  String? memorialId;

  MemorialService() {
    getLoginUserData();
    headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT',
      'Accept': 'application/json',
      'content-type': 'application/json',
    };
  }

  Future<void> getLoginUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileString = prefs.getString('userProfile') ?? '{}';
    var loginuser = json.decode(userProfileString);
    if (loginuser != null) {
      accessToken = loginuser['id'];
    }
  }

  Future<dynamic> addMemorial(Map<String, dynamic> memorialInfo,
      [String successMsg = 'Memorial Information is Saved']) async {
    getLoginUserData();
    String addMemorialUrl = '$apiUrl/Memorials/?access_token=$accessToken';
    try {
      var response = await http.post(Uri.parse(addMemorialUrl),
          headers: headers, body: json.encode(memorialInfo));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to add memorial');
      }
    } catch (e) {
      print('Error adding memorial: $e');
      throw e;
    }
  }

  Future<dynamic> getMemorialDetails(String? memorialIdDetail) async {
    getLoginUserData();
    if (memorialIdDetail != null) {
      this.memorialId = memorialIdDetail;
    }
    var filterJSON = json.encode({
      'include': ['theme', 'circle'],
    });
    String filter = Uri.encodeComponent(filterJSON);
    String profileURL =
        '$apiUrl/Memorials/$memorialId?access_token=$accessToken&filter=$filter';
    try {
      var response = await http.get(Uri.parse(profileURL));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch memorial details');
      }
    } catch (e) {
      print('Error fetching memorial details: $e');
      throw e;
    }
  }

  Future<dynamic> getAllMemorial(String userId) async {
    getLoginUserData();
    var filterJSON = json.encode({
      'where': {
        'userId': userId,
        'created_for_me': false,
      },
      'order': 'createdAt DESC',
    });
    String filter = Uri.encodeComponent(filterJSON);
    String allMemorialURL =
        '$apiUrl/Memorials/?access_token=$accessToken&filter=$filter';
    try {
      var response = await http.get(Uri.parse(allMemorialURL));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch all memorials');
      }
    } catch (e) {
      print('Error fetching all memorials: $e');
      throw e;
    }
  }

  Future<dynamic> getAllMemorialsForHome() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userProfileString = prefs.getString('userProfile') ?? '{}';
    var userData = json.decode(userProfileString);
    Map<String, dynamic> filterJSON = userData.isNotEmpty
        ? {
            'where': {
              'or': [
                {'visible_to': 'public', 'created_for_me': false},
                {
                  'visible_to': 'protected',
                  'created_for_me': false,
                  'showContacts': {
                    'elemMatch': {
                      'mobileNo': userData['countryCode'] + userData['mobileNo']
                    }
                  }
                },
                {
                  'isPublish': true,
                  'visible_to': 'public',
                  'created_for_me': true
                },
                {
                  'isPublish': true,
                  'visible_to': 'protected',
                  'created_for_me': true,
                  'showContacts': {
                    'elemMatch': {
                      'mobileNo': userData['countryCode'] + userData['mobileNo']
                    }
                  }
                },
              ],
            },
            'limit': 5,
            'order': 'updatedAt DESC',
            'include': 'user',
          }
        : {
            'where': {
              'or': [
                {'visible_to': 'public', 'created_for_me': false},
                {
                  'visible_to': 'public',
                  'isPublish': true,
                  'created_for_me': true
                },
              ],
            },
            'order': 'updatedAt DESC',
            'limit': 5,
            'include': 'user',
          };
    String filter = Uri.encodeComponent(json.encode(filterJSON));
    String url = '$apiUrl/Memorials/?access_token=$accessToken&filter=$filter';

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load memorials');
      }
    } catch (e) {
      print('Error getting memorials: $e');
      throw e;
    }
  }

  Future<dynamic> editMemorial(
      Map<String, dynamic> memorialInfo, String memorialId,
      {bool last = false,
      bool msg = true,
      String successMsg = 'Memorial Info has been updated'}) async {
    String url = '$apiUrl/Memorials/$memorialId?access_token=$accessToken';
    try {
      var response = await http.patch(Uri.parse(url),
          body: json.encode(memorialInfo), headers: headers);
      if (response.statusCode == 200) {
        // Implement success logic and message handling
        return json.decode(response.body);
      } else {
        throw Exception('Failed to edit memorial');
      }
    } catch (e) {
      print('Error editing memorial: $e');
      throw e;
    }
  }

  Future<dynamic> deleteMemorial(String memorialId) async {
    String url = '$apiUrl/Memorials/$memorialId?access_token=$accessToken';
    try {
      var response = await http.delete(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        // Implement deletion success logic
        return json.decode(response.body);
      } else {
        throw Exception('Failed to delete memorial');
      }
    } catch (e) {
      print('Error deleting memorial: $e');
      throw e;
    }
  }

  Future<dynamic> updateAllMemorial(Map<String, dynamic> memorialInfo,
      Map<String, dynamic> oldCondition) async {
    String filter = Uri.encodeComponent(json.encode(oldCondition));
    String url =
        '$apiUrl/Memorials/update?where=$filter&access_token=$accessToken';
    try {
      var response = await http.post(Uri.parse(url),
          body: json.encode(memorialInfo), headers: headers);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to update memorials');
      }
    } catch (e) {
      print('Error updating memorials: $e');
      throw e;
    }
  }

  Future<dynamic> getAllMemorialsForCircle(String circleId) async {
    var filterJSON = {
      'where': {
        'visible_to_circle': circleId,
      },
    };
    String filter = Uri.encodeComponent(json.encode(filterJSON));
    String url = '$apiUrl/Memorials/?access_token=$accessToken&filter=$filter';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load memorials');
      }
    } catch (e) {
      print('Error getting memorials: $e');
      throw e;
    }
  }

  Future<void> deleteForCircle(String circleId) async {
    try {
      var memorials = await getAllMemorialsForCircle(circleId);
      for (var memorial in memorials) {
        if (memorial['visible_to_circle'].length > 1) {
          memorial['visible_to_circle'].remove(circleId);
          await editMemorial(
              {'visible_to_circle': memorial['visible_to_circle']},
              memorial['id']);
        } else {
          await editMemorial(
              {'visible_to': 'protected', 'visible_to_circle': []},
              memorial['id']);
        }
      }
    } catch (e) {
      print('Error processing deletion for circle: $e');
      throw e;
    }
  }

  Future<dynamic> memorialCount(String userId) async {
    var filterJSON = {
      'userId': userId,
      'created_for_me': false,
    };
    String filter = Uri.encodeComponent(json.encode(filterJSON));
    String url = '$apiUrl/Memorials/count?where=$filter';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to count memorials');
      }
    } catch (e) {
      print('Error counting memorials: $e');
      throw e;
    }
  }

  int savedMemorial = 0;
  bool themeMenuToggle = true;
  String savedStep = 'Posted';
  bool nonLinearStep = false;
  int tabValue = 0;
  bool presetMemorialThemeToggle = false;
  int ripRequestTabValue = 0;
}
