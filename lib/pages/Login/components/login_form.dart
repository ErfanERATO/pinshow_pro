//ساخت فرم و دکمه‌ی ثبت برای لاگین کردن
//ــــــــــــــــــــــــــــــــــــــــــــــــــــ
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinshow_pro/Components/default_button.dart';
import 'package:pinshow_pro/Components/no_account_text.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/Forget_password/forget_password_screen.dart';
import 'package:pinshow_pro/size_config.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  String? password;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildIntlPhoneField(),
          // buildPhoneNumberFormField(),
          //ایجاد فاصله بین دو فرم شماره تلفن و پسوورد
          SizedBox(height: getScreenHeight(10)),
          buildPasswordFormField(),
          //ایجاد فاصله بین فرم پسوورد و متن فراموش کردن پسوورد
          SizedBox(height: getScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: Colors.deepOrangeAccent,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text(getTranslated(context, 'remember_check_box')!),
              //ایجاد فاصله بین چک باکس و متن فراموشی پسوورد
              const Spacer(),
              //دادن خاصیت کلیک شدن به تکست فراموش شدن پسوورد
              GestureDetector(
                onTap: () {
                  debugPrint("Forget pass pressed");
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Text(
                  getTranslated(context, 'forgot_password')!,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          //ایجاد فاصله بین دکمه ثبت از عناصر بالای اون
          SizedBox(height: getScreenHeight(270)),
          DefaultButton(
            text: getTranslated(context, 'button_text')!,
            press: () {
              debugPrint("Screens.Login pressed");
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // _isLoading ? null : _login;
              }
            },
          ),
          SizedBox(
            height: getScreenHeight(20),
          ),
          //نمایش متن ایجاد حساب کاربری در صورت نداشتن آن
          const NoAccountText(),
        ],
      ),
    );
  }

  //intl_phone_fieldساخت فیلد وارد کردن شماره تلفن به همراه کد کشور با استفاده از پکیج
  IntlPhoneField buildIntlPhoneField() {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: getTranslated(context, 'phone_number_label_text')!,
      ),
      onSaved: (newValue) => phoneNumber = newValue! as String,
      initialCountryCode: 'IR',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      controller: phoneNumberController,
    );
  }

  //ساخت فیلد وارد کردن پسوورد
  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return getTranslated(context, 'enter_password_error')!;
        } else if (value.length <= 6) {
          return getTranslated(context, 'enter_valid_password_error')!;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: getTranslated(context, 'password')!,
        // suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
      controller: passwordController,
    );
  }
}
