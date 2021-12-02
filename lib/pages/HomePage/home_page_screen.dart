import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/model/groups_data.dart';
import 'package:pinshow_pro/nework/user_groups_api.dart';
import 'package:pinshow_pro/pages/HomePage/components/body.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/home_screen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(CupertinoIcons.info_circle_fill),
            onPressed: () {
              debugPrint("info_pressed");
            },
          ),
        ],
        title: Text(
          getTranslated(context, 'home_page_app_bar_title')!,
          style: const TextStyle(
            fontFamily: ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
            fontSize: 25,
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: const Icon(CupertinoIcons.placemark),
        onPressed: () async {
          debugPrint("FAB pressed");
          // UserGroupsAPI.createUserGroupsResponse().then((author){
          //   return null;
          // });
          List groupDatas = await fetchPosts(http.Client());
          // this will print the id and the title of posts
          groupDatas.forEach((group) => print('Group name: ${group.name}  |  Post title: ${group.id}'));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 55,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.indigo,
          elevation: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () {
                  debugPrint("Setting pressed");
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.place,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () {
                  debugPrint("Location pressed");
                },
              ),
              const SizedBox(
                width: 25,
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () {
                  debugPrint("Chat pressed");
                },
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.checkmark_seal_fill,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () {
                  debugPrint("place pressed");
                },
              ),
            ],
          ),
        ),
      ),
      //استفاده از استک برای قرار دادن شیپ دست ساز روی تمام آبجکت ها
      body: const Body(),
    );
  }
}
//ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
//ساخت شیپ دستی اپپ بار پایین صفحه
//تستی
// class BNBCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.indigo
//       ..style = PaintingStyle.fill;
//     Path path = Path()..moveTo(0, 20);
//
//     path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     path.arcToPoint(Offset(size.width * 0.60, 20),
//         radius: const Radius.circular(20.0), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, 20);
//     canvas.drawShadow(path, Colors.black, 5, true);
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
