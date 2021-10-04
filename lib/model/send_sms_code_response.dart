// To parse this JSON data, do
//
//     final sendSmsCodeResponse = sendSmsCodeResponseFromJson(jsonString);

import 'dart:convert';

SendSmsCodeResponse sendSmsCodeResponseFromJson(String str) =>
    SendSmsCodeResponse.fromJson(json.decode(str));

String sendSmsCodeResponseToJson(SendSmsCodeResponse data) =>
    json.encode(data.toJson());

class SendSmsCodeResponse {
  SendSmsCodeResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  List<dynamic> data;

  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =>
      SendSmsCodeResponse(
        success: json["success"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
