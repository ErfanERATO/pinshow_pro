import 'dart:convert';

import 'package:http/http.dart';
import 'package:pinshow_pro/model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  static const String url = 'http://testapi.pinshow.ir/api/v1/login';

  static Future<LoginResponse> createLoginResponse(String phone , String password) async {
    // static Future<Response> createPhoneVerify(String phone) async {
    final Response response = await post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-localization': 'fa',
      },
      body: {"phone": phone, "password" : password},
    );
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      print('Error');
      print(response.statusCode);
      throw Exception("Can't get user information");
    }
  }

  void upDateSharedPreferences(String token, int id) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', token);
    _prefs.setInt('id', id);
  }


}