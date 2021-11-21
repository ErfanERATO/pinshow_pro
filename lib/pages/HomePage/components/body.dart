import 'package:flutter/material.dart';
import 'package:pinshow_pro/dataBaseHelper/database_helper.dart';
import 'package:pinshow_pro/nework/user_groups_api.dart';
import 'package:pinshow_pro/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    // //فراخونی api گروه ها
    UserGroupsAPI.createUserGroups().then((author) {
      return null;
    });

    return SafeArea(
      //ساخت بدنه برای نمایش فرم ها و دکمه‌ی ثبت
      child: Container(
        width: getScreenWidth(double.infinity),
        height: getScreenHeight(707),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}