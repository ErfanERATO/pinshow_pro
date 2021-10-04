import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinshow_pro/pages/Enter_option/components/body.dart';
import 'package:pinshow_pro/size_config.dart';

class EnterOption extends StatelessWidget {
  const EnterOption({Key? key}) : super(key: key);
  //اختصاص دادن یک کلید برای Route
  static String routeName = "/enter_option";

  @override
  Widget build(BuildContext context) {
    //برای تعین اندازه های صفحه نیازه که قرار بگیره
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
