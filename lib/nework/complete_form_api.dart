import 'dart:convert';

import 'package:http/http.dart';
import 'package:pinshow_pro/model/complete_form_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompleteFormAPI {
  static const String completeFormUrl =
      'http://testapi.pinshow.ir/api/v1/register';

  static Future<CompleteFormResponse> createCompleteForm(
    String phone,
    String code,
    String name,
    String email,
    String password,
    String password_confirmation,
  ) async {
    final Response response = await post(
      Uri.parse(completeFormUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-localization': 'fa',
        'Expect': '100-Continue'
      },
      body: {
        "phone": phone,
        // "code": code,
        "code": "222222",
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      return CompleteFormResponse.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception("Can't Send information");
    }
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
}
