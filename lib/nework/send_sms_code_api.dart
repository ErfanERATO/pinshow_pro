import 'dart:convert';

import 'package:http/http.dart';
import 'package:pinshow_pro/model/send_sms_code_response.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SendSmsCodeAPI {
  static const String smsUrl =
      'http://testapi.pinshow.ir/api/v1/verifyBackPhone';

  static Future<SendSmsCodeResponse> createSendSmsCode(
      // String phone, String code) async {
       String code, String phone) async {
    final Response response = await post(
      Uri.parse(smsUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-localization': 'en',
        // 'Expect': '100-Continue',
      },
      body: {"code": code, "phone" : phone},
    );
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      return SendSmsCodeResponse.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception("Can't send Sms Code");
    }
  }

  // static Future<String?> getPhoneNumber() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? phone = prefs.getString("phone");
  //   return phone;
  // }
}
