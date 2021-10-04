import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/Login/login_screen.dart';
import 'package:pinshow_pro/pages/verify_phone/verify_phone_2_screen.dart';
import 'package:pinshow_pro/size_config.dart';
// import 'package:pinshow_pro/pages/verification_phone/verification_phone_screen.dart';

class BottomEnterOption extends StatelessWidget {
  const BottomEnterOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ساخت BottomSheet پایین صفحه برای نمایش گزینه های ورود یا ایجاد اکانت
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff5c6ccd),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    getTranslated(context, 'welcome_to_app')!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily:
                            ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
                        fontSize: 28),
                  ),
                  SizedBox(height: getScreenHeight(8),),
                  Text(
                    getTranslated(context, 'bottom_welcome_text')!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily:
                            ("assets/fonts/farsi/IRANYekanMobileMedium.ttf"),
                        fontSize: 18),
                  ),
                  //ایجاد فاصله بین متن بالا از گزینه های ورود و ساخت اکانت
                  SizedBox(height: getScreenHeight(35)),
                  TextButton(
                    child: Text(
                      getTranslated(context, 'login')!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily:
                            ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
                      ),
                    ),
                    onPressed: () {
                      debugPrint("login_pressed");
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                  ),
                  //ایجاد خط بین گزینه ورود و ساخت اکانت
                  Divider(
                    color: Colors.white,
                    height: getScreenHeight(8),
                  ),
                  TextButton(
                    child: Text(
                      getTranslated(context, 'sign_up')!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily:
                            ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
                      ),
                    ),
                    onPressed: () {
                      debugPrint("sign_up_pressed");
                      // Navigator.pushNamed(context, VerificationPhoneScreen.routeName);
                      Navigator.pushNamed(context, VerifyPhone2.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
