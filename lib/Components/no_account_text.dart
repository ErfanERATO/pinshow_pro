import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/verify_phone/verify_phone_2_screen.dart';
import 'package:pinshow_pro/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //چون قراره در یک ردیف نمایش داده بشن باید داخل Row قرار بگیرن
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          getTranslated(context, 'Do_not_have_an_account_Q')!,
          style: TextStyle(
            fontSize: getScreenWidth(16),
            fontFamily: "assets/fonts/farsi/IRANYekanMobileMedium.ttf",
          ),
        ),
        //اضافه کردن خاصیت کلیک شدن به متن
        GestureDetector(
          onTap: () {
            debugPrint("create account pressed");
            Navigator.pushNamed(context, VerifyPhone2.routeName);
          },
          child: Text(
            getTranslated(context, 'Do_not_have_an_account_A')!,
            style: TextStyle(
              fontSize: getScreenWidth(16),
              color: Colors.deepOrange,
              fontFamily: "assets/fonts/farsi/IRANYekanMobileMedium.ttf",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        //اظافه کردن خاصیت پرس شدن به متن SignUp
      ],
    );
  }
}
