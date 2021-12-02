// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    required this.token,
    required this.user,
    required this.groups,
  });

  String token;
  User user;
  List<Group> groups;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    user: User.fromJson(json["user"]),
    groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
  };
}

class Group {
  Group({
    required this.name,
    required this.id,
    this.inviteCode,
    required this.privateStatus,
    required this.groupDefault,
    this.groupPhoto,
  });

  String name;
  int id;
  dynamic inviteCode;
  String privateStatus;
  String groupDefault;
  dynamic groupPhoto;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    name: json["name"],
    id: json["id"],
    inviteCode: json["invite_code"],
    privateStatus: json["private_status"],
    groupDefault: json["default"],
    groupPhoto: json["group_photo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "invite_code": inviteCode,
    "private_status": privateStatus,
    "default": groupDefault,
    "group_photo": groupPhoto,
  };
}

class User {
  User({
    required this.name,
    this.email,
    required this.phone,
    this.userProfilePath,
  });

  String name;
  dynamic email;
  String phone;
  dynamic userProfilePath;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    userProfilePath: json["user_profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "user_profile_path": userProfilePath,
  };
}