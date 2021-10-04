import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/size_config.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //قرار دادن لوگو به همراه متن کنار اون و متن پایین اون ها در یک ستون
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //قرار دادن لوگو و متن کنار اون در یک ردیف
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //نمایش لوگو
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/PINSHOW_LOGO.png"),
                ),
              ),
            ),
            //برای ایجاد فاصله بین لوگو و متن کنار اون
            SizedBox(width: getScreenWidth(20)),
            //قرار دادن دو متن کنار لوگو در یک ستون
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  getTranslated(context, 'side_logo_text')!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
                    fontSize: 50,
                  ),
                ),
                const Text(
                  "Pinshow.ir",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: ("assets/fonts/farsi/IRANYekanMobileMedium.ttf"),
                      fontSize: 30),
                ),
                //برای ایجاد فاصله بین دو متن کناری لوگو
                SizedBox(height: getScreenWidth(17)),
              ],
            ),
          ],
        ),
        //برای ایجاد فاصله بین متن زیر لوگو با لوگو
        SizedBox(height: getScreenHeight(11)),

        Text(
          getTranslated(context, 'bottom_logo_text')!,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontFamily: ("assets/fonts/farsi/IRANYekanMobileMedium.ttf"),
              fontSize: 18),
        ),
      ],
    );
  }
}
