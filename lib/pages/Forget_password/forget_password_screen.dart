import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/Forget_password/components/body.dart';
import 'package:pinshow_pro/size_config.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);
  //اختصاص دادن یک کلید برای Route
  static String routeName = "/forget_password";

  @override
  Widget build(BuildContext context) {
    //برای تعین اندازه های صفحه نیازه که قرار بگیره
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text(
          getTranslated(context, 'title')!,
          style: const TextStyle(
            fontFamily: ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
            fontSize: 25,
          ),
        ),
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
