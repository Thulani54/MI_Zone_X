import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mi_zone/models/AppUser.dart';

import '../Constants/constants.dart';

Future<Map<String, dynamic>> createUser(
    String firstName,
    String lastName,
    String email,
    String username,
    String dateOfBirth,
    String gender,
    String contactNumber,
    String accountType,
    String password,
    String confirmPassword) async {
  final url = Uri.parse('${Constants.baseUrl}/register');
  final headers = {"Content-Type": "application/json"};
  Map<String, dynamic> body = {
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'username': username,
    'date_of_birth': dateOfBirth,
    'gender': gender,
    'contact_number': contactNumber,
    'account_type': accountType,
    'password': password,
    'cpassword': confirmPassword,
    'for_someone_else': false
  };

  final response =
      await http.post(url, headers: headers, body: json.encode(body));

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse["message"] ==
            "Registration was successful check your email for OTP code" &&
        jsonResponse["status"] == "Success") {
      Constants.current_user = AppUser(
        title: "",
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: DateTime.now(),
        gender: gender,
        idNumber: "",
        contactNumber: contactNumber,
        email: email,
        username: username,
        password: password,
        accountStatus: null,
        timestamp: DateTime.now(),
        lastUpdate: DateTime.now(),
        otp: "",
        emailUsername: "",
        profilePic: "",
        accountType: "",
        dateTimestamp: DateTime.now(),
        dateLastUpdate: DateTime.now(),
        middleName: "",
        relationship: "",
        dateOfDeath: null,
        isHidden: false,
      );
    }

    Constants.current_user = AppUser.fromJson(json.decode(response.body));
    return json.decode(response.body);
  } else {
    throw Exception('Failed to create a new user.');
  }
}

Future<Map<String, dynamic>> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('${Constants.baseUrl}/login/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to login');
  }
}

Future<Map<String, dynamic>> getUserDetails() async {
  final response = await http.get(
    Uri.parse('${Constants.baseUrl}/getUserDetails/'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch user details');
  }
}

Future<Map<String, dynamic>> sendOTPPasswordReset(String email) async {
  final response = await http.post(
    Uri.parse('${Constants.baseUrl}/sendOTPPasswordrest/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
    }),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to send OTP');
  }
}

Future<Map<String, dynamic>> updatePassword(
    String email, String password, String cpassword, String otp) async {
  final response = await http.post(
    Uri.parse('${Constants.baseUrl}/updatePassword/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
      'cpassword': cpassword,
      'otp': otp,
    }),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to update password');
  }
}

Future<Map<String, dynamic>> updateUserDetails(Map<String, String> data,
    [File? file]) async {
  var uri = Uri.parse('${Constants.baseUrl}/update_user_details/');
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
    throw Exception('Failed to update user details');
  }
}
