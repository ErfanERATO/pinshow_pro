import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/Login/login_screen.dart';
import 'package:pinshow_pro/size_config.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //چون قراره در یک ردیف نمایش داده بشن باید داخل Row قرار بگیرن
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          getTranslated(context, 'Do_you_have_an_account_Q')!,
          style: TextStyle(
            fontSize: getScreenWidth(16),
            fontFamily: "assets/fonts/farsi/IRANYekanMobileMedium.ttf",
          ),
        ),
        //اضافه کردن خاصیت کلیک شدن به متن
        GestureDetector(
          onTap: () {
            //انتقال صفحه
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          child: Text(
            getTranslated(context, 'Do_you_have_an_account_A')!,
            style: TextStyle(
              fontSize: getScreenWidth(16),
              color: Colors.deepOrange,
              fontFamily: "assets/fonts/farsi/IRANYekanMobileBold.ttf",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
