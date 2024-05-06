import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefs {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";
  static String sharedPreferenceUserEmailKey2 = "USEREMAILKEY";
  static String sharedPreferenceUidKey = "USEREUIDKEY";
  static String sharedPreferenceCellKey = "USERECELLKEY";
  static String sharedPreferenceEmpIdKey = "USEREEMPIDKEY";
  static String sharedPreferenceCecClientIdKey = "USERCECCLIENTIDKEY";
  static String sharedPasswordPrefKey = "USERPASSWORDKEY";
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmpIdSharedPreference(int cec_employeeid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt(sharedPreferenceEmpIdKey, cec_employeeid);
  }

  static Future<bool> saveUserPasswordPreference(String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPasswordPrefKey, password);
  }

  static Future<bool> saveUserCecClientIdSharedPreference(
      int cec_client_id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt(
        sharedPreferenceCecClientIdKey, cec_client_id);
  }

  static Future<bool> saveUserUidSharedPreference(String uid) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUidKey, uid);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  static Future<bool> saveUserEmailSharedPreference2(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(
        sharedPreferenceUserEmailKey2, userEmail);
  }

  static Future<bool> saveUserCellSharedPreference(String userCell) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceCellKey, userCell);
  }

  //Get Prefs
  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String?> getUserNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserNameKey);
  }

  static Future<int?> getEmpIdSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getInt(sharedPreferenceEmpIdKey);
  }

  static Future<int?> getCecClientIdSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getInt(sharedPreferenceCecClientIdKey);
  }

  static Future<String?> getUserEmailSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserEmailKey);
  }

  static Future<String?> getUserEmailSharedPreference2() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserEmailKey2);
  }

  static Future<String?> getUserCellSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceCellKey);
  }

  static Future<String?> getUserUidSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUidKey);
  }

  static Future<String?> getUserPasswordPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPasswordPrefKey);
  }
}

class EncryptedSharedPreferences {
  static final key = encrypt.Key.fromUtf8("GP3sP7n9yCC&E)H@TcQfTj4nZT4u7x!A");
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static Future<bool> saveEncryptedString(String key, String value) async {
    final encryptedValue = encrypter.encrypt(value, iv: iv).base64;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, encryptedValue);
  }

  static Future<String?> getDecryptedString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final encryptedValue = prefs.getString(key);
    if (encryptedValue != null) {
      return encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedValue),
          iv: iv);
    }
    return null;
  }

  static Future<bool> saveEncryptedInt(String key, int value) async {
    final encryptedValue = encrypter.encrypt(value.toString(), iv: iv).base64;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, encryptedValue);
  }

  static Future<bool> saveEncryptedDouble(String key, double value) async {
    final encryptedValue = encrypter.encrypt(value.toString(), iv: iv).base64;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, encryptedValue);
  }

  static Future<bool?> getDecryptedBool(String key) async {
    final decryptedValue = await _getDecryptedValue(key);
    return decryptedValue == null
        ? null
        : decryptedValue.toLowerCase() == 'true';
  }

  static Future<int?> getDecryptedInt(String key) async {
    final decryptedValue = await _getDecryptedValue(key);
    return decryptedValue == null ? null : int.tryParse(decryptedValue);
  }

  static Future<double?> getDecryptedDouble(String key) async {
    final decryptedValue = await _getDecryptedValue(key);
    return decryptedValue == null ? null : double.tryParse(decryptedValue);
  }

  static Future<String?> _getDecryptedValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final encryptedValue = prefs.getString(key);
    if (encryptedValue != null) {
      return encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedValue),
          iv: iv);
    }
    return null;
  }

  static Future<bool> saveLastLoginDateTime(DateTime dateTime) async {
    final String dateTimeString = dateTime.toIso8601String();
    return saveEncryptedString('lastLoginDateTime', dateTimeString);
  }

  static Future<DateTime?> getLastLoginDateTime() async {
    final String? decryptedDateTimeString =
        await getDecryptedString('lastLoginDateTime');
    if (decryptedDateTimeString != null) {
      return DateTime.tryParse(decryptedDateTimeString);
    }
    return null;
  }

  static Future<bool> saveUserCredentials(
      Map<String, dynamic> credentials) async {
    final String credentialsJson = jsonEncode(credentials);
    return saveEncryptedString('userCredentials', credentialsJson);
  }

  static Future<Map<String, dynamic>?> getUserCredentials() async {
    final String? decryptedCredentialsJson =
        await getDecryptedString('userCredentials');
    if (decryptedCredentialsJson != null) {
      return jsonDecode(decryptedCredentialsJson) as Map<String, dynamic>;
    }
    return null;
  }
}
