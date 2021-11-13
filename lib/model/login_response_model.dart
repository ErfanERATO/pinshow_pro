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


  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }

  fromMap(Map<String, dynamic> map) {
    success = map["success"];
    message = map["message"];
    data = map["data"];
  }

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


  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'user': user,
      'groups': groups,
    };
  }

  fromMap(Map<String, dynamic> map) {
    token = map["token"];
    user = map["user"];
    groups = map["groups"];
  }


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
    required this.generatedCodeTime,
    required this.expiredCodeTime,
  });

  String name;
  int id;
  dynamic inviteCode;
  String privateStatus;
  String groupDefault;
  dynamic groupPhoto;
  int generatedCodeTime;
  String expiredCodeTime;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'inviteCode': inviteCode,
      'privateStatus': privateStatus,
      'groupDefault': groupDefault,
      'groupPhoto': groupPhoto,
      'generatedCodeTime': generatedCodeTime,
      'expiredCodeTime': expiredCodeTime,
    };
  }

  fromMap(Map<String, dynamic> map) {
    name = map["name"];
    id = map["id"];
    inviteCode = map["inviteCode"];
    privateStatus = map["privateStatus"];
    groupDefault = map["groupDefault"];
    groupPhoto = map["groupPhoto"];
    generatedCodeTime = map["generatedCodeTime"];
    expiredCodeTime = map["expiredCodeTime"];
  }

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    name: json["name"],
    id: json["id"],
    inviteCode: json["invite_code"],
    privateStatus: json["private_status"],
    groupDefault: json["default"],
    groupPhoto: json["group_photo"],
    generatedCodeTime: json["generated_code_time"],
    expiredCodeTime: json["expired_code_time"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "invite_code": inviteCode,
    "private_status": privateStatus,
    "default": groupDefault,
    "group_photo": groupPhoto,
    "generated_code_time": generatedCodeTime,
    "expired_code_time": expiredCodeTime,
  };
}

class User {
  User({
    required this.name,
    required this.email,
    required this.phone,
    this.userProfilePath,
  });

  String name;
  String email;
  String phone;
  dynamic userProfilePath;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'userProfilePath': userProfilePath,
    };
  }

  fromMap(Map<String, dynamic> map) {
    name = map["name"];
    email = map["email"];
    phone = map["phone"];
    userProfilePath = map["userProfilePath"];
  }

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
