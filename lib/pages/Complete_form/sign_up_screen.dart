import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/Complete_form/components/body.dart';
import 'package:pinshow_pro/size_config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  //مشخص کردن یه کلید برای Route
  static String routeName = "/signup_screen";

  @override
  Widget build(BuildContext context) {
    //برای تعین اندازه های صفحه نیازه که قرار بگیره
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      //ساخت تایتل اپ بار بالای صفحه
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          getTranslated(context, 'title')!,
          style: const TextStyle(
            fontFamily: ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
            fontSize: 25,
          ),
        ),
        //سایه‌ی اپ بار رو برابر صفر قرار میدیم تا با پس زمینه همسطح بشه
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
