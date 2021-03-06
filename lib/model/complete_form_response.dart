// // To parse this JSON data, do
// //
// //     final completeFormResponse = completeFormResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// CompleteFormResponse completeFormResponseFromJson(String str) =>
//     CompleteFormResponse.fromJson(json.decode(str));
//
// String completeFormResponseToJson(CompleteFormResponse data) =>
//     json.encode(data.toJson());
//
// class CompleteFormResponse {
//   CompleteFormResponse({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   bool success;
//   String message;
//   Data data;
//
//   factory CompleteFormResponse.fromJson(Map<String, dynamic> json) =>
//       CompleteFormResponse(
//         success: json["success"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data.toJson(),
//       };
// }
//
// class Data {
//   Data({
//     required this.token,
//     required this.groups,
//   });
//
//   String token;
//   List<Group> groups;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         token: json["token"],
//         groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "token": token,
//         "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
//       };
// }
//
// class Group {
//   Group({
//     required this.id,
//     this.inviteCode,
//     required this.name,
//     required this.privateStatus,
//     required this.groupDefault,
//     this.groupPhoto,
//     this.generatedCodeTime,
//     required this.expiredCodeTime,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.pivot,
//   });
//
//   int id;
//   dynamic inviteCode;
//   String name;
//   String privateStatus;
//   String groupDefault;
//   dynamic groupPhoto;
//   dynamic generatedCodeTime;
//   String expiredCodeTime;
//   DateTime createdAt;
//   DateTime updatedAt;
//   Pivot pivot;
//
//   factory Group.fromJson(Map<String, dynamic> json) => Group(
//         id: json["id"],
//         inviteCode: json["invite_code"],
//         name: json["name"],
//         privateStatus: json["private_status"],
//         groupDefault: json["default"],
//         groupPhoto: json["group_photo"],
//         generatedCodeTime: json["generated_code_time"],
//         expiredCodeTime: json["expired_code_time"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         pivot: Pivot.fromJson(json["pivot"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "invite_code": inviteCode,
//         "name": name,
//         "private_status": privateStatus,
//         "default": groupDefault,
//         "group_photo": groupPhoto,
//         "generated_code_time": generatedCodeTime,
//         "expired_code_time": expiredCodeTime,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "pivot": pivot.toJson(),
//       };
// }
//
// class Pivot {
//   Pivot({
//     required this.userId,
//     required this.groupId,
//   });
//
//   String userId;
//   String groupId;
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//         userId: json["user_id"],
//         groupId: json["group_id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "user_id": userId,
//         "group_id": groupId,
//       };
// }

// To parse this JSON data, do
//
//     final sendSmsCodeResponse = sendSmsCodeResponseFromJson(jsonString);
// To parse this JSON data, do
//
//     final completeFormResponse = completeFormResponseFromJson(jsonString);

import 'dart:convert';

CompleteFormResponse completeFormResponseFromJson(String str) => CompleteFormResponse.fromJson(json.decode(str));

String completeFormResponseToJson(CompleteFormResponse data) => json.encode(data.toJson());

class CompleteFormResponse {
  CompleteFormResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data data;

  factory CompleteFormResponse.fromJson(Map<String, dynamic> json) => CompleteFormResponse(
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
    required this.group,
    required this.user,
  });

  String token;
  Group group;
  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    group: Group.fromJson(json["group"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "group": group.toJson(),
    "user": user.toJson(),
  };
}

class Group {
  Group({
    this.name,
    required this.id,
    this.inviteCode,
    this.privateStatus,
    this.groupDefault,
    this.groupPhoto,
  });

  dynamic name;
  int id;
  dynamic inviteCode;
  dynamic privateStatus;
  dynamic groupDefault;
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
