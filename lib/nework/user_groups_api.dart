import 'dart:convert';

import 'package:http/http.dart';
import 'package:pinshow_pro/model/groups_data.dart';

class UserGroups {
  static const String userGroupsUrl =
      'https://testapi.pinshow.ir/api/v1/userGroups';

  static Future<GroupData> createUserGroups() async {
    final Response response = await get(
      Uri.parse(userGroupsUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-localization': 'en',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      return GroupData.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception("Can't get user group's");
    }
  }
}
