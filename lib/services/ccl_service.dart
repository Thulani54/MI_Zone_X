import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CclService {
  final String primaryVariable = 'https://qa.miinsightsapps.net/strawberry/';
  final String environmentUrl =
      'https://qa.miinsightsapps.net/strawberry/cclapi/';

  // Endpoint definitions
  final String getProdCat = 'get-product-categories/';
  final String getEduVideos = 'get-eduvid/?category=';
  final String getVideoCat = 'get-video-categories/';
  final String postVideoReactions = 'set-video-reaction/';
  final String updateUserDetailUrl = 'updateUser/';
  final String journalEntryUrl = 'journal/';
  final String getJournalDetailsUrl = 'get-journal/?user_id=';
  final String createNewMemorialIdUrl = 'add-memory/';
  final String memorialBioUrl = 'add-bio/';
  final String memorialLifeUrl = 'add-life/?memory_id=';
  final String memorialLifeContributorsUrl = 'add-contributor/';
  final String memorialStoryUrl = 'add-story/';
  final String getMemoriesUrl = 'get-memories/?mem_id=';
  final String getAllMemorialsUrl = 'get-all-memories/?app_user_id=';
  final String removeMemoryUrl = 'remove-memory/';
  final String getShareMemorial = 'get_share_memory/';
  final String getFriendsUrl = 'get-friends/?app_user_id=';
  final String addNewFriendsUrl = 'friendship/';
  final String getAllUsersUrl = 'get-all-users/?app_user_id=';
  final String postFamilyTreeUrl = 'add-family-member/';
  final String postTreeBranchNameUrl = 'add-tree-title/';
  final String getTreeBranchNameUrl = 'get-tree-titles/?app_user_id=';
  final String getFamilyMembersUrl = 'get-family-members/?app_user_id=';
  final String postFamilyTotemUrl = 'family-tree-totem/';
  final String getFamilyTotemUrl = '';
  final String addTributesUrl = 'add-tribute/';
  final String AddLegendUrl = 'add-legend/';
  final String getLegendUrl = 'get-legends/?app_user_id=';
  final String AddMessagetoLegendUrl = 'add-message-to-legend/';
  final String getMessagesUrl = 'get-legend-messages/?app_user_id=';
  final String AddVoteUrl = 'add-vote/';
  final String getVotesUrl = 'get-votes/?app_user_id=';
  final String posttunesUrl = 'postTunes/';
  final String add_theme_and_songUrl = 'addTheme/';
  final String gettunesUrl = 'getTunes/';
  final String postFuneralDetailsUrl = 'add-funeral-details/';
  final String getFuneralDetailsUrl = 'get-funeral-details/?app_user_id=';

  // Http Client
  final http.Client httpClient = http.Client();

  Future<dynamic> getProductCategories() async {
    var response = await httpClient.get(Uri.parse(environmentUrl + getProdCat));
    return _handleResponse(response);
  }

  Future<dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  final String apiUrl = 'https://qa.miinsightsapps.net/strawberry/cclapi/';

  Future<dynamic> getVideos(String category) async {
    final response = await httpClient
        .get(Uri.parse(apiUrl + 'get-eduvid/?category=$category'));
    return json.decode(response.body);
  }

  Future<dynamic> getVideoCategory() async {
    final response =
        await httpClient.get(Uri.parse(apiUrl + 'get-video-categories/'));
    return json.decode(response.body);
  }

  Future<dynamic> postVideoReaction(Map<String, dynamic> reaction) async {
    final response = await httpClient.post(
        Uri.parse(apiUrl + 'set-video-reaction/'),
        body: json.encode(reaction),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body);
  }

  Future<dynamic> getFriends(String appUserId) async {
    final response = await httpClient
        .get(Uri.parse(apiUrl + 'get-friends/?app_user_id=$appUserId'));
    return json.decode(response.body);
  }

  Future<dynamic> getTotem(String appUserId) async {
    final response = await httpClient
        .get(Uri.parse(apiUrl + 'family-tree-totem/?app_user_id=$appUserId'));
    return json.decode(response.body);
  }

  Future<dynamic> postTotem(Map<String, dynamic> totem) async {
    final response = await httpClient.post(
        Uri.parse(apiUrl + 'add-family-member/'),
        body: json.encode(totem),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body);
  }

  Future<dynamic> addNewFriends(Map<String, dynamic> friends) async {
    final response = await httpClient.post(Uri.parse(apiUrl + 'friendship/'),
        body: json.encode(friends),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body);
  }

  Future<dynamic> getAllUsers(String appUserId) async {
    final response = await httpClient
        .get(Uri.parse(apiUrl + 'get-all-users/?app_user_id=$appUserId'));
    return json.decode(response.body);
  }

  Future<dynamic> funeralEntryDetail(
      Map<String, dynamic> funeralDetails) async {
    final response = await httpClient.post(
        Uri.parse(apiUrl + 'add-funeral-details/'),
        body: json.encode(funeralDetails),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body);
  }

  Future<dynamic> getFuneralDetails(String appUserId) async {
    final response = await httpClient
        .get(Uri.parse(apiUrl + 'get-funeral-details/?app_user_id=$appUserId'));
    return json.decode(response.body);
  }

  Future<dynamic> journalEntryDetail(Map<String, dynamic> journalDetail) async {
    final response = await httpClient.post(Uri.parse(apiUrl + 'journal/'),
        body: json.encode(journalDetail),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body);
  }

  Future<dynamic> getJournalDetails(String userId) async {
    final response = await httpClient
        .get(Uri.parse(apiUrl + 'get-journal/?user_id=$userId'));
    return json.decode(response.body);
  }

  Future<dynamic> deleteMemory(String memorialId) async {
    final response = await httpClient.post(Uri.parse(apiUrl + 'remove-memory/'),
        body: json.encode({'mem_id': memorialId}),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body);
  }

  Future<dynamic> getAllMemories(String appUserId) async {
    final response = await httpClient
        .get(Uri.parse(apiUrl + 'get-all-memories/?app_user_id=$appUserId'));
    return json.decode(response.body);
  }

  Future<dynamic> getMemory(String memId) async {
    final response =
        await httpClient.get(Uri.parse(apiUrl + 'get-memories/?mem_id=$memId'));
    return json.decode(response.body);
  }

  Future<dynamic> getShareMemory() async {
    final response =
        await httpClient.get(Uri.parse(apiUrl + 'get_share_memory/'));
    return json.decode(response.body);
  }

  Future<dynamic> createNewMemorialId(
      Map<String, dynamic> createMemorial) async {
    final response = await httpClient.post(Uri.parse(apiUrl + 'add-memory/'),
        body: json.encode(createMemorial),
        headers: {'Content-Type': 'application/json'});
    return json.decode(response.body);
  }
}

final String apiUrl = 'https://qa.miinsightsapps.net/strawberry/cclapi/';

Client client = Client();

Future<dynamic> lifeDetails(Map<String, dynamic> memorialLife) async {
  final response = await client.post(Uri.parse(apiUrl + 'add-life/?memory_id='),
      body: jsonEncode(memorialLife),
      headers: {'Content-Type': 'application/json'});
  return jsonDecode(response.body);
}

Future<dynamic> storyDetails(
    Map<String, dynamic> lifeStoryCon, BuildContext context) async {
  final response = await client.post(Uri.parse(apiUrl + 'add-contributor/'),
      body: jsonEncode(lifeStoryCon),
      headers: {'Content-Type': 'application/json'});
  // Handling the response based on your service's logic
  if (jsonDecode(response.body)['status'] == 'Success') {
    // Flutter's way to show a Snackbar
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Update was successfully')));
  } else {
    throw Exception('Failed to load data');
  }
  return jsonDecode(response.body);
}

Future<dynamic> memorialStories(
    Map<String, dynamic> memorialStory, Map<String, String> headers) async {
  final response = await client.post(Uri.parse(apiUrl + 'add-story/'),
      body: jsonEncode(memorialStory), headers: headers);
  return jsonDecode(response.body);
}

Future<dynamic> addTributesToMem(Map<String, dynamic> memorialTributes) async {
  final response = await client.post(Uri.parse(apiUrl + 'add-tribute/'),
      body: jsonEncode(memorialTributes),
      headers: {'Content-Type': 'application/json'});
  return jsonDecode(response.body);
}

Future<dynamic> legendDetails(
    Map<String, dynamic> legendDet, Map<String, String> headers) async {
  final response = await client.post(Uri.parse(apiUrl + 'add-legend/'),
      body: jsonEncode(legendDet), headers: headers);
  return jsonDecode(response.body);
}

Future<dynamic> addVote(Map<String, dynamic> votes) async {
  final response = await client.post(Uri.parse(apiUrl + 'add-vote/'),
      body: jsonEncode(votes), headers: {'Content-Type': 'application/json'});
  return jsonDecode(response.body);
}

Future<dynamic> getVoteList(String appUserId) async {
  final response =
      await client.get(Uri.parse(apiUrl + 'get-votes/?app_user_id=$appUserId'));
  return jsonDecode(response.body);
}

Future<dynamic> getMessageList(String appUserId, String legendId) async {
  final response = await client.get(Uri.parse(apiUrl +
      'get-legend-messages/?app_user_id=$appUserId&legend_id=$legendId'));
  return jsonDecode(response.body);
}

Future<dynamic> leaveMessageForLegend(Map<String, dynamic> leaveMessage) async {
  final response = await client.post(
      Uri.parse(apiUrl + 'add-message-to-legend/'),
      body: jsonEncode(leaveMessage),
      headers: {'Content-Type': 'application/json'});
  return jsonDecode(response.body);
}

Future<dynamic> getListOfLegends(String appUserId) async {
  final response = await client
      .get(Uri.parse(apiUrl + 'get-legends/?app_user_id=$appUserId'));
  return jsonDecode(response.body);
}

Future<dynamic> updateUserDetail(
    Map<String, dynamic> updateInfo, Map<String, String> headers) async {
  final response = await client.post(Uri.parse(apiUrl + 'updateUser/'),
      body: jsonEncode(updateInfo), headers: headers);
  return jsonDecode(response.body);
}

Future<dynamic> addFamilyMember(
    Map<String, dynamic> fam, Map<String, String> headers) async {
  final response = await client.post(Uri.parse(apiUrl + 'add-family-member/'),
      body: jsonEncode(fam), headers: headers);
  return jsonDecode(response.body);
}

Future<dynamic> addFamilyTreeBranch(Map<String, dynamic> treeLabel) async {
  final response = await client.post(Uri.parse(apiUrl + 'add-tree-title/'),
      body: jsonEncode(treeLabel),
      headers: {'Content-Type': 'application/json'});
  return jsonDecode(response.body);
}

Future<dynamic> getFamilyTreeBranch(String userId) async {
  final response = await client
      .get(Uri.parse(apiUrl + 'get-tree-titles/?app_user_id=$userId'));
  return jsonDecode(response.body);
}

Future<dynamic> addTune(
    Map<String, dynamic> tunes, Map<String, String> headers) async {
  final response = await client.post(Uri.parse(apiUrl + 'postTunes/'),
      body: jsonEncode(tunes), headers: headers);
  return jsonDecode(response.body);
}

Future<dynamic> getTunes() async {
  final response = await client.get(Uri.parse(apiUrl + 'getTunes/'));
  return jsonDecode(response.body);
}

Future<dynamic> addThemeSong(Map<String, dynamic> tunes) async {
  final response = await client.post(Uri.parse(apiUrl + 'addTheme/'),
      body: jsonEncode(tunes), headers: {'Content-Type': 'application/json'});
  return jsonDecode(response.body);
}

Future<dynamic> getFamilyMembers(String userId) async {
  final response = await client
      .get(Uri.parse(apiUrl + 'get-family-members/?app_user_id=$userId'));
  return jsonDecode(response.body);
}

String? getUserDetails() {
  // return sessionStorage.getItem('userDetails'); // This is a hypothetical method; you'll need to use an appropriate method to access session storage in Dart.
}
