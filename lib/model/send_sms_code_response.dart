// // To parse this JSON data, do
// //
// //     final sendSmsCodeResponse = sendSmsCodeResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// SendSmsCodeResponse sendSmsCodeResponseFromJson(String str) =>
//     SendSmsCodeResponse.fromJson(json.decode(str));
//
// String sendSmsCodeResponseToJson(SendSmsCodeResponse data) =>
//     json.encode(data.toJson());
//
// class SendSmsCodeResponse {
//   SendSmsCodeResponse({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   bool? success;
//   String? message;
//   List<dynamic> data;
//
//   factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =>
//       SendSmsCodeResponse(
//         success: json["success"],
//         message: json["message"],
//         data: List<dynamic>.from(json["data"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x)),
//       };
// }

// To parse this JSON data, do
//
//     final sendSmsCodeResponse = sendSmsCodeResponseFromJson(jsonString);

import 'dart:convert';

SendSmsCodeResponse sendSmsCodeResponseFromJson(String str) => SendSmsCodeResponse.fromJson(json.decode(str));

String sendSmsCodeResponseToJson(SendSmsCodeResponse data) => json.encode(data.toJson());

class SendSmsCodeResponse {
  SendSmsCodeResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) => SendSmsCodeResponse(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}

