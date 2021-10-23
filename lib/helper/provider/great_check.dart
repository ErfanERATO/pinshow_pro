// این صحفه برای اضافه کردن دیتا و مدیریت آن ها می باشد
//ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
// import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pinshow_pro/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:pinshow_pro/model/groups_data.dart';

class GreatGroup with ChangeNotifier {
  List<GroupData> _items = [];

  List<GroupData> get items {
    //مقداری return کپی از _items
    return [..._items];
  }

  void addUserGroup(
    int pickedId,
    int pickedServerId,
    String pickedName,
    String pickedInviteCode,
    String pickedPrivateStatus,
    String pickedDefaultGroup,
    String pickedGeneratedCodeTime,
    String pickedExpiredCodeTime,
  ) {
    final newGroup = GroupData(
      id: pickedId,
      serverId: pickedServerId,
      name: pickedName,
      inviteCode: pickedInviteCode,
      privateStatus: pickedPrivateStatus,
      defaultGroup: pickedDefaultGroup,
      generatedCodeTime: pickedGeneratedCodeTime,
      expiredCodeTime: pickedExpiredCodeTime,
    );
    _items.add(newGroup);
    notifyListeners();

    DBHelper.insert('user_groups', {
      'id': newGroup.id,
      'serverId' : newGroup.serverId,
      'name': newGroup.name,
      'inviteCode': newGroup.inviteCode,
      'privateStatus': newGroup.privateStatus,
      'defaultGroup': newGroup.defaultGroup,
      'generatedCodeTime': newGroup.generatedCodeTime,
      'expiredCodeTime': newGroup.expiredCodeTime,
    });
  }

  Future<void> fetchAndSetUserGroup() async {
    final dataList = await DBHelper.getData('user_groups');
    _items = dataList
        .map(
          (item) => GroupData(
            id: item['id'],
            serverId: item['severId'],
            name: item['name'],
            inviteCode: item['inviteCode'],
            privateStatus: item['privateStatus'],
            defaultGroup: item['defaultGroup'],
            generatedCodeTime: item['generatedCodeTime'],
            expiredCodeTime: item['expiredCodeTime'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
