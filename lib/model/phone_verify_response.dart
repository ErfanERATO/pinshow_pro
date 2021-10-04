import 'dart:convert';

VerifyPhoneResponse responseModelFromJson(String str) =>
    VerifyPhoneResponse.fromJson(json.decode(str));

String responseModelToJson(VerifyPhoneResponse data) =>
    json.encode(data.toJson());

class VerifyPhoneResponse {
  VerifyPhoneResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory VerifyPhoneResponse.fromJson(Map<String, dynamic> json) =>
      VerifyPhoneResponse(
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
  Data({
    required this.mobile,
    required this.status,
  });

  String? mobile;
  int status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mobile: json["mobile"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "status": status,
      };
}
