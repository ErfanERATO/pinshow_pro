import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/size_config.dart';
import 'package:pinshow_pro/pages/Sms_verification/components/body.dart';


class SmsVerificationScreen extends StatelessWidget {
  const SmsVerificationScreen({Key? key}) : super(key: key);
  static String routeName = "/SMS";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          getTranslated(context, 'title')!,
          style: const TextStyle(
            fontFamily: ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
            fontSize: 25,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
