import 'dart:convert';

import 'package:http/http.dart';
import 'package:pinshow_pro/model/phone_verify_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyPhoneAPI {
  static const String url = 'http://testapi.pinshow.ir/api/v1/verifyPhone';

  static Future<VerifyPhoneResponse> createPhoneVerify(String phone) async {
    // static Future<Response> createPhoneVerify(String phone) async {
    final Response response = await post(
      Uri.parse(url),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-localization': 'fa',
        'Expect': '100-Continue'
      },
      // body: jsonEncode(<String, String>{"phone": phone}),
      body: {"phone": phone},
    );
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      return VerifyPhoneResponse.fromJson(json.decode(response.body));
    } else {
      // print('Error');
      print(response.statusCode);
      throw Exception("Can't Send Phone Number");
    }
    // return response;
  }
}
