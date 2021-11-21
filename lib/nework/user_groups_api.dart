import 'dart:convert';

import 'package:http/http.dart';
import 'package:pinshow_pro/model/groups_data.dart';

class UserGroupsAPI {
  static const String userGroupsUrl =
      'http://testapi.pinshow.ir/api/v1/userGroups';

  static Future<GroupData> createUserGroups() async {
    final Response response = await get(
      Uri.parse(userGroupsUrl),
      headers: <String, String>{
        'Accept': 'application/json',
        'X-localization': 'en',
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzUxOGFlZWYyOTNmOTBkMjNjMTg0NTg0ODRkZTgyMGIwMjFhMTE1NDkxZjIzZTQ3MTVmNmQ4NTAzYTNhMTNiYzk0NjYzMTNlMTNmMzUwMzEiLCJpYXQiOjE2MzYwMDgzMjksIm5iZiI6MTYzNjAwODMyOSwiZXhwIjoxNjY3NTQ0MzI5LCJzdWIiOiIxOCIsInNjb3BlcyI6W119.eRN2VcA2Sov4YF7y6q9PdX2zroqrZg_q7hc8VVDxq_jayd6s36j_ihIZVBcIrBRh6V955u8KVUyMCNTwfIYEmqgW6UxFwSPzwXDUeLXVHKgP2xavJ1sPBYvJQpvfSd6E9AIufaSOvjjCBFYpx3eLQAKEv4H0INXVpi4W-U6pXB1WwVUtI3fNA2VwuRCp4gKVZ-HUB8z8PV-82OVGTuQVRiXdWpt451xu39q_alsRTRC9j4X7ljVUHHfI9E19h5HH0cnYHsH5L_iv6IAc6NVvat8_NZ9tQB5nKuEQlYpLOyyp9SZpVfTwZI9CGGLWV42QiGYYSGGDGggQDu2DrZfgMMKnIZL02qDUGKgHRtrXvkZmSmmW-QtSQOSjbubYjEQxLYDI91ztaZm22TRb_Y0bplQGjYCZPYJAVGdBu8_REXA7GHQxcCIm_eh7TMTZQDEk87h4zLcNCRW1Yzn9PANRME0nEamYpvYIHkINZ3JWVgImDlxy3ITYEqUSlHdhzN4QddtLbSNEeQGMS_RMAqWMDCtOqFcHyncuJxwlViHPheQi44Jk3_FAhWg_rJcse2QoY6u3fzDQGazYnCkzUkOCFMsOf2MpJM3pSlVeM_FGMOknPN2e4YhTs8NpHaWZdXMNgUJaw27QUrBeaI5Jn68F4CKASbaUYeCUUuA8euaQ53M',
        // 'Expect': '100-Continue',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);

      // Pivot pivot = Pivot(userId: "465416", groupId: "62161");
      // print(pivot);
      // return GroupData.fromJson(json.decode(response.body));
      return GroupData.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception("Can't get user group's");
    }
  }
}
