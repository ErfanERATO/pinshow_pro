import 'package:flutter/material.dart';
import 'package:pinshow_pro/size_config.dart';

//ساخت دکمه ادامه در پایین صفحه
class DefaultButton extends StatelessWidget {
  //پارامتر های مورد نیاز دکمه
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getScreenHeight(50),
      child: ElevatedButton(
        //متن نمایش داده شده روی دکمه
        child: Text(
          text,
          style: TextStyle(
            fontSize: getScreenWidth(18),
            fontFamily: "assets/fonts/farsi/IRANYekanMobileMedium.ttf",
            fontWeight: FontWeight.bold,
          ),
        ),
        //استایل دهی و ساخت شیپ دکمه
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        //خاصیت کلیک شدن دکمه
        onPressed: press,
      ),
    );
  }
}
