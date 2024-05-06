import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class FeedService {
  final String apiUrl =
      'https://api.example.com/'; // Adjust with actual API endpoint
  String accessToken = 'your_access_token';
  String userId = 'your_user_id';

  FeedService() {
    getLoginUserData();
  }

  void getLoginUserData() {
    // Normally, you would fetch user data from secure storage or similar
    this.userId = 'example_user_id';
    this.accessToken = 'example_access_token';
  }

  Future<dynamic> markReadFeeds(String route) async {
    var filterJSON = {'userId': userId, 'route': route};
    var url = '$apiUrl' +
        'feeds/update?access_token=$accessToken&where=' +
        Uri.encodeComponent(jsonEncode(filterJSON));
    var updateObj = {'read': true};

    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(updateObj),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to mark feed as read');
      }
    } catch (e) {
      throw Exception('Error marking feed as read: $e');
    }
  }

  Future<dynamic> sendNotification(Map<String, dynamic> assetPersonInfo,
      {String successMsg = "Asset person added successfully"}) async {
    var url = '$apiUrl' + 'feeds/apple-error?access_token=$accessToken';
    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode(assetPersonInfo),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to send notification');
      }
    } catch (e) {
      throw Exception('Error sending notification: $e');
    }
  }

  Future<dynamic> getUrl(String urlParam) async {
    var url =
        '$apiUrl' + 'feeds/shortUrl?url=$urlParam&access_token=$accessToken';
    try {
      var response = await http
          .post(Uri.parse(url), headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to shorten URL');
      }
    } catch (e) {
      throw Exception('Error shortening URL: $e');
    }
  }

  Future<int> unreadCount() async {
    var filterJSON = {'userId': userId, 'read': false};
    var url = '$apiUrl' +
        'feeds/count?where=' +
        Uri.encodeComponent(jsonEncode(filterJSON));
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body)['count'];
      } else {
        throw Exception('Failed to get unread count');
      }
    } catch (e) {
      throw Exception('Error getting unread count: $e');
    }
  }

  Future<dynamic> editFeed(Map<String, dynamic> feedInfo, String feedId,
      {String successMsg = "Feed updated successfully"}) async {
    var url = '$apiUrl' + 'feeds/$feedId?access_token=$accessToken';
    try {
      var response = await http.patch(Uri.parse(url),
          body: jsonEncode(feedInfo),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to edit feed');
      }
    } catch (e) {
      throw Exception('Error editing feed: $e');
    }
  }

  Future<dynamic> deleteFeed(String feedId) async {
    var url = '$apiUrl' + 'feeds/$feedId?access_token=$accessToken';
    try {
      var response = await http.delete(Uri.parse(url));
      if (response.statusCode == 200) {
        return json
            .decode(response.body); // Usually just a success message or empty
      } else {
        throw Exception('Failed to delete feed');
      }
    } catch (e) {
      throw Exception('Error deleting feed: $e');
    }
  }

  Future<dynamic> unsubscribe(String userId,
      {String successMsg = "Unsubscribed successfully"}) async {
    var url = '$apiUrl' +
        'feeds/unsubscribe?userId=$userId&access_token=$accessToken';
    try {
      var response = await http
          .post(Uri.parse(url), headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to unsubscribe');
      }
    } catch (e) {
      throw Exception('Error unsubscribing: $e');
    }
  }
}
