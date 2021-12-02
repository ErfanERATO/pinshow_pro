// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:pinshow_pro/model/groups_data.dart';
// import 'package:http/http.dart' as;
//
// class UserGroupsAPI {
//   static const String userGroupsUrl =
//       'http://testapi.pinshow.ir/api/v1/userGroups';
//
//   static Future<GroupData> createUserGroupsResponse() async {
//     final Response response = await get(
//       Uri.parse(userGroupsUrl),
//       headers: <String, String>{
//         'Accept': 'application/json',
//         'X-localization': 'en',
//         'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjY5MjUzODVmNDNiNjI1ZjBjNjk3NWEwNmE1MzNjMmE3YmY4ZTQ1MDdkZGE4Yzk1MzdkMDhiOWZhY2NmYjc3YzlkMDZlNzU3NDM5YTZlYWMiLCJpYXQiOjE2MzgxNzIxMzksIm5iZiI6MTYzODE3MjEzOSwiZXhwIjoxNjY5NzA4MTM4LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.sIIMMB4fgNxRGdtDueNMoMqnq6J00YdVNnFlIRjq9Xz48YBOWItTeZJYl_4ZQ48muCzF6etaKPsmFT2b1Mv-WztEpUaVG4zhf_xIjLuD0rXSt2Koa0NA_ZbkoyrUdRA2fmkGgohsFh05n-qK4jVGrFOW19BTcFTn_Ya0uM6NZg4kxGB05pEeJSYfO5EfhEmshtPuPwSxtejVreVbZTM0s0id8fvEQmfDKZyodtKebqMeg2ms3asth2XVsS-qe2CMwDyli9VdQr3-Oa2yWVFisA3ZOKBkXWMBddHX0yM_Ageq1gSLBpYOjonVcibt6M0Qn21o2mMzq6GCg2IduhjP85wLTUmWEg6lBXv0tKRUAYnptQVt0JPvR9nCn2Ij3k6SUcHnExO_m1zHYM4aMCCFEyVDFFfH5TBqUr8JgM_ztx2X3tS8egRHYF7atvFI6qWKqwbAbggyfFBz0L7SeCOTrZHE7FS38c4T0uhyuRdvsaNk0wneV9qx7_CIXr3QuXz6SSmBsOZmAA2vhym-svQIWHMYoDjVFbLKN0U2VIfp72_dyaMw_bzcz5axpiQ68p5Y9UtiT0Bdw19ZnGWU5O53yNHmBammG2VCZ1H0PUmRjKN8C6rlbQZyoYlLKyHMEshEHWWMZBG1emfnhzla2k3h1ixnDGzSyKhXN-JQOzUxarQ',
//         // 'Expect': '100-Continue',
//       },
//     );

//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       //object from group
//       Group newGroup = Group();
//       //create list of group
//       List groupName = <Group>[];
//       //get group from body
//       Group.fromJson(json.decode(response.body));
//       //fill list from groups of body
//       List<Group> fillList(String responseBody){
//         final filled = json.decode(responseBody).cast<Map<String , dynamic>>();
//         return filled.map<Group>((json) => Group.fromJson(json)).toList();
//       }
//       //loop over list
//           //print group.name
//       return GroupData.fromJson(json.decode(response.body));
//     } else {
//       print(response.statusCode);
//       print(response.body);
//       throw Exception("Can't get user group's");
//     }
//   }
//
//   // A function that converts a response body into a List<Group>.
//   // List<GroupData> toListGroup (String responseBody){
//   //   final parsed = jsonDecode(responseBody).cast<Map<String , dynamic>>();
//   //   return parsed.map<GroupData>((json) => GroupData.fromJson(json)).toList;
//   // }
// }

import 'dart:convert';

import 'package:pinshow_pro/model/groups_data.dart';
import 'package:http/http.dart' as http;

Future<List<Group>> fetchPosts(http.Client client) async {
  final response = await client.get(
    Uri.parse('http://testapi.pinshow.ir/api/v1/userGroups'),
    headers: <String, String>{
      'Accept': 'application/json',
      'X-localization': 'en',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjY5MjUzODVmNDNiNjI1ZjBjNjk3NWEwNmE1MzNjMmE3YmY4ZTQ1MDdkZGE4Yzk1MzdkMDhiOWZhY2NmYjc3YzlkMDZlNzU3NDM5YTZlYWMiLCJpYXQiOjE2MzgxNzIxMzksIm5iZiI6MTYzODE3MjEzOSwiZXhwIjoxNjY5NzA4MTM4LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.sIIMMB4fgNxRGdtDueNMoMqnq6J00YdVNnFlIRjq9Xz48YBOWItTeZJYl_4ZQ48muCzF6etaKPsmFT2b1Mv-WztEpUaVG4zhf_xIjLuD0rXSt2Koa0NA_ZbkoyrUdRA2fmkGgohsFh05n-qK4jVGrFOW19BTcFTn_Ya0uM6NZg4kxGB05pEeJSYfO5EfhEmshtPuPwSxtejVreVbZTM0s0id8fvEQmfDKZyodtKebqMeg2ms3asth2XVsS-qe2CMwDyli9VdQr3-Oa2yWVFisA3ZOKBkXWMBddHX0yM_Ageq1gSLBpYOjonVcibt6M0Qn21o2mMzq6GCg2IduhjP85wLTUmWEg6lBXv0tKRUAYnptQVt0JPvR9nCn2Ij3k6SUcHnExO_m1zHYM4aMCCFEyVDFFfH5TBqUr8JgM_ztx2X3tS8egRHYF7atvFI6qWKqwbAbggyfFBz0L7SeCOTrZHE7FS38c4T0uhyuRdvsaNk0wneV9qx7_CIXr3QuXz6SSmBsOZmAA2vhym-svQIWHMYoDjVFbLKN0U2VIfp72_dyaMw_bzcz5axpiQ68p5Y9UtiT0Bdw19ZnGWU5O53yNHmBammG2VCZ1H0PUmRjKN8C6rlbQZyoYlLKyHMEshEHWWMZBG1emfnhzla2k3h1ixnDGzSyKhXN-JQOzUxarQ',
      // 'Expect': '100-Continue',
    },
  );
  return parseGroup(response.body);
}

List<Group> parseGroup(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Group>((json) => Group.fromJson(json)).toList();
}