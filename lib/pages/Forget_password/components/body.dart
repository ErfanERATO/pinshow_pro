import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/Forget_password/components/forget_password_form.dart';
import 'package:pinshow_pro/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        //ساخت بدنه برای نمایش فرم ها و دکمه‌ی ثبت
        child: Container(
          width: getScreenWidth(double.infinity),
          height: getScreenHeight(733),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          //ایجاد فاصله با گوشه های دستگاه
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(15)),
            //نمایش متن هدینگ صفحه و نمایش فرم ها
            child: Column(
              children: <Widget>[
                SizedBox(height: getScreenHeight(26)),
                Text(
                  getTranslated(context, 'forget_password_header')!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                SizedBox(height: getScreenHeight(30),),
                ForgotPassForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
