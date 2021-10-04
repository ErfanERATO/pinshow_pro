//ایجاد بدنه اصلی برای نمایش فرم ها و دکمه‌ی ثبت
//ـــــــــــــــــــــــــــــــــــــــــــــــــــــ
import 'package:flutter/material.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/Complete_form/components/sign_up_form.dart';
import 'package:pinshow_pro/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ایجاد خاصیت اسکرول شدن پیج تا در صورت بزرگتر شدن از صفحه دستگاه با ارور مواجه نشیم
    return SingleChildScrollView(
      child: SafeArea(
        //ساخت بدنه برای نمایش فرم ها و دکمه‌ی ثبت
        child: Container(
          width: getScreenWidth(double.infinity),
          height: getScreenHeight(900),
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
                SizedBox(height: getScreenHeight(20)),
                //متن نمایش داده شده به عنوان هدر فرم
                 Text(
                  getTranslated(context, 'complete_form_header')!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
                //ایجاد فاصله بین متن هدر و فرم ها
                SizedBox(height: getScreenHeight(20)),
                //نمایش فرم ها
                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
