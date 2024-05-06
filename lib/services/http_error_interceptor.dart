import 'dart:async';

import 'package:http/http.dart' as http;

class HttpErrorInterceptor {
  final UserService userService;

  HttpErrorInterceptor({required this.userService});

  Future<http.Response> intercept(http.Request request) async {
    try {
      final response =
          await http.Client().send(request).then(http.Response.fromStream);
      if (response.statusCode == 200) {
        return response; // Successful response handling
      } else {
        return _handleError(response);
      }
    } on http.ClientException catch (e) {
      // Client-side error
      print('Error: ${e.message}');
      throw Exception('Error: ${e.message}');
    }
  }

  http.Response _handleError(http.Response response) {
    if (response.statusCode == 401) {
      // Example of logout on 401 Unauthorized
      userService.logout();
      // Optionally navigate to the login screen if your app context permits
      // Navigator.pushNamed(context, '/login');
    }
    // You can handle more status codes here
    throw Exception(
        'Error Code: ${response.statusCode}\nMessage: ${response.body}');
  }
}

class UserService {
  void logout() {
    print('User logged out');
    // Add logic for logging out the user, e.g., clearing shared preferences, etc.
  }
}

// Usage
void main() {
  var userService = UserService();
  var interceptor = HttpErrorInterceptor(userService: userService);
  var request = http.Request('GET', Uri.parse('https://example.com/data'));

  interceptor.intercept(request).then((response) {
    print('Response body: ${response.body}');
  }).catchError((error) {
    print('Caught error: $error');
  });
}
