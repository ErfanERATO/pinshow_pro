import 'package:flutter/material.dart';

import 'package:pinshow_pro/Components/logo_with_text.dart';
import 'package:pinshow_pro/pages/verify_phone/components/bottom_veri_form.dart';
import 'package:pinshow_pro/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(double.infinity),
      decoration: const BoxDecoration(
        color: Color(0xFF3f51b5),
      ),
      child: Column(
        children: <Widget>[
          //ایجاد فاصله لوگو به همراه متن ها از بالای صفحه
          SizedBox(height: getScreenHeight(240)),
          //نمایش لوگو به همراه متن های اون
          const LogoWithText(),
          //ایجاد فاصله بین BottomSheet پایین صفحه و لوگو
          SizedBox(height: getScreenHeight(80)),
          //نمایش BottomSheet پایین صفحه برای نمایش گزینه های ورود
          const Expanded(
            child: BottomVerifyForm(),
          ),
        ],
      ),
    );
  }
}
