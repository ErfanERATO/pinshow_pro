import 'dart:convert';

import 'package:http/http.dart';
import 'package:pinshow_pro/model/send_sms_code_response.dart';

class SendSmsCodeAPI {
  static const String smsUrl =
      'https://testapi.pinshow.ir/api/v1/verifyBackPhone';

  static Future<SendSmsCodeResponse> createSendSmsCode(
      // String phone, String code) async {
       String code) async {
    final Response response = await post(
      Uri.parse(smsUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-localization': 'en',
        // 'Expect': '100-Continue',
      },
      // body: {"phone": phone, "code": code},
      body: {"code": "222222"},
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
}
