import 'package:flutter/material.dart';
import 'package:pinshow_pro/size_config.dart';
import 'package:pinshow_pro/pages/verify_phone/components/body.dart';

class VerifyPhone2 extends StatelessWidget {
  const VerifyPhone2({Key? key}) : super(key: key);
  static String routeName = "/verify_phone_2";

  @override
  Widget build(BuildContext context) {
    //برای تعین اندازه های صفحه نیازه که قرار بگیره
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
