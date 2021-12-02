// To parse this JSON data, do
//
//     final groupData = groupDataFromJson(jsonString);

import 'dart:convert';

GroupData groupDataFromJson(String str) => GroupData.fromJson(json.decode(str));

String groupDataToJson(GroupData data) => json.encode(data.toJson());

class GroupData {
  bool success;
  String message;
  Data data;


  GroupData({
    required this.success,
    required this.message,
    required this.data,
  });

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

  factory GroupData.fromJson(Map<String, dynamic> json) => GroupData(
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
  String token;
  List<Group> groups;

  Data({
    required this.token,
    required this.groups,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'groups': groups,
    };
  }

  fromMap(Map<String, dynamic> map) {
    token = map["token"];
    groups = map["groups"];
  }


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
  };
}

class Group {
  int? id;
  dynamic inviteCode;
  String? name;
  String? privateStatus;
  String? groupDefault;
  dynamic groupPhoto;
  dynamic generatedCodeTime;
  String? expiredCodeTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;


  Group({
    this.id,
    this.inviteCode,
    this.name,
    this.privateStatus,
    this.groupDefault,
    this.groupPhoto,
    this.generatedCodeTime,
    this.expiredCodeTime,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'inviteCode': inviteCode,
      'name': name,
      'privateStatus': privateStatus,
      'groupDefault': groupDefault,
      'groupPhoto': groupPhoto,
      'generatedCodeTime': generatedCodeTime,
      'expiredCodeTime': expiredCodeTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'pivot': pivot,
    };
  }

  fromMap(Map<String, dynamic> map) {
    id = map["id"];
    inviteCode = map["inviteCode"];
    name = map["name"];
    privateStatus = map["privateStatus"];
    groupDefault = map["groupDefault"];
    groupPhoto = map["groupPhoto"];
    generatedCodeTime = map["generatedCodeTime"];
    expiredCodeTime = map["expiredCodeTime"];
    createdAt = map["createdAt"];
    updatedAt = map["updatedAt"];
    pivot = map["pivot"];
  }



  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json["id"],
    inviteCode: json["invite_code"],
    name: json["name"],
    privateStatus: json["private_status"],
    groupDefault: json["default"],
    groupPhoto: json["group_photo"],
    generatedCodeTime: json["generated_code_time"],
    expiredCodeTime: json["expired_code_time"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "invite_code": inviteCode,
    "name": name,
    "private_status": privateStatus,
    "default": groupDefault,
    "group_photo": groupPhoto,
    "generated_code_time": generatedCodeTime,
    "expired_code_time": expiredCodeTime,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  String userId;
  String groupId;

  Pivot({
    required this.userId,
    required this.groupId,
  });


  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'groupId': groupId,
    };
  }

  fromMap(Map<String, dynamic> map) {
    userId = map["userId"];
    groupId = map["groupId"];
  }

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    userId: json["user_id"],
    groupId: json["group_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "group_id": groupId,
  };
}
