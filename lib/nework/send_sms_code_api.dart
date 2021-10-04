import 'dart:convert';

import 'package:http/http.dart';
import 'package:pinshow_pro/model/send_sms_code_response.dart';

class SendSmsCodeAPI {
  static const String smsUrl =
      'http://testapi.pinshow.ir/api/v1/verifyBackPhone';

  static Future<SendSmsCodeResponse> createSendSmsCode(
      String phone, String code) async {
    final Response response = await post(
      Uri.parse(smsUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-localization': 'fa',
        'Expect': '100-Continue'
      },
      body: {"phone": phone, "code": code},
    );
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      return SendSmsCodeResponse.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      throw Exception("Can't send Sms Code");
    }
  }
}
