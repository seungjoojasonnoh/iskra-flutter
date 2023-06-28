import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  static final headers = {
    'Content-Type': 'application/json',
    'X-Iskra-App-Id': 'CZwN6amAlUUzJRJbD1Qa',
  };
  static const baseUrl = "https://alpha-api.iskra.world";
  static const email = "jason.noh@iskra.world";
  static const password = "1Q2w3e!!";
  static var cookie = '';

  static getCookie() async {
    var url = "$baseUrl/auth/v1/users/login";
    var result = await http.post(Uri.parse(url),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: headers);
    return result.headers['set-cookie'];
  }
}
