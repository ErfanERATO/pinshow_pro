import 'package:flutter/material.dart';
import 'package:pinshow_pro/Components/default_button.dart';
import 'package:pinshow_pro/Components/have_account_text.dart';
import 'package:pinshow_pro/home/home.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/nework/complete_form_api.dart';
import 'package:pinshow_pro/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? phone;
  String? code;
  String? name;
  String? email;
  String? password;
  String? password_confirmation;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildCodeFormField(),
          SizedBox(height: getScreenHeight(30)),
          buildNumberFormField(),
          SizedBox(height: getScreenHeight(30)),
          //نمایش فیلد وارد کردن نام توسط کاربر
          buildNameFormField(),
          SizedBox(height: getScreenHeight(30)),
          //نمایش فیلد وارد کردن ایمیل توسط کاربر
          buildEmailFormField(),
          SizedBox(height: getScreenHeight(30)),
          //نمایش فیلد وارد کردن گذرواژه توسط کاربر
          buildPasswordFormField(),
          SizedBox(height: getScreenHeight(30)),
          //نمایش فیلد وارد کردن تاییدیه گذرواژه توسط کاربر
          buildConformPassFormField(),
          SizedBox(height: getScreenHeight(50)),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
                  ),
                  GestureDetector(
                    child: const Text(
                      "حریم خصوصی",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      debugPrint("privacy in pressed");
                    },
                  ),
                  const Text("  و "),
                  GestureDetector(
                    child: const Text(
                      "  قوانین استفاده از نرم‌افزار ",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      debugPrint("rules in pressed");
                    },
                  ),
                  const Text("با ثبت نام شما تمامی"),
                ],
              ),
              SizedBox(
                height: getScreenHeight(4),
              ),
              const Text(" .نرم‌افزار را پذیرفته‌اید"),
            ],
          ),
          SizedBox(height: getScreenHeight(80)),
          //دکمه پیشفرض برای ادامه
          DefaultButton(
            text: getTranslated(context, 'button_text')!,
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushNamed(context, HomePage.routeName);
                CompleteFormAPI.createCompleteForm(
                  phone.toString(),
                  code.toString(),
                  name.toString(),
                  email.toString(),
                  password.toString(),
                  password_confirmation.toString(),
                ).then((author) {
                  return null;
                });
              }
            },
          ),
          SizedBox(height: getScreenHeight(20)),
          //متن داشن اکانت و ورود به صفحه لاگین
          const HaveAccountText(),
        ],
      ),
    );
  }

  //فیلد دریافت تاییدیه پسوور ورودی کاربر
  TextFormField buildConformPassFormField() {
    return TextFormField(
      controller: confirmPassController,
      obscureText: true,
      onSaved: (newValue) => password_confirmation = newValue!,
      //اعتبار سنجی فرم
      validator: (value) {
        if (value!.isEmpty) {
          return getTranslated(context, 'confirm_password_error')!;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: getTranslated(context, 'confirm_password_label_text')!,
        suffixIcon: const Icon(Icons.lock),
      ),
    );
  }

  //فیلد دریافت پسوورد ورودی کاربر
  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      //اعتبار سنجی فرم
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
        suffixIcon: const Icon(Icons.lock),
      ),
    );
  }

  //فیلد دریافت ایمیل وارد شده کاربر
  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      onSaved: (newValue) => email = newValue!,
      // اعتبار سنجی فرم
      // validator: (value){
      //   const pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      //   final regExp = RegExp(pattern);
      //   if(regExp.hasMatch(value!)){
      //     return getTranslated(context, 'entered_email_invalid_error')!;
      //   }else if(value.isEmpty){
      //     return getTranslated(context, 'entered_email_error')!;
      //   }else{
      //   return null;
      //   }
      // },
      decoration: InputDecoration(
        labelText: getTranslated(context, 'email')!,
        suffixIcon: const Icon(Icons.email),
      ),
    );
  }

  //فیلد ردیافت نام ورودی کاربر
  TextFormField buildNameFormField() {
    return TextFormField(
      controller: firstNameController,
      onSaved: (newValue) => name = newValue!,
      //اعتبار سنجی فرم
      validator: (value) {
        if (value!.isEmpty) {
          return getTranslated(context, 'enter_name_error')!;
        } else if (value.length <= 4) {
          return getTranslated(context, 'name_too_short_error')!;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: getTranslated(context, 'name')!,
        suffixIcon: const Icon(Icons.person),
      ),
    );
  }

  //_____________________________________________________
  TextFormField buildCodeFormField() {
    return TextFormField(
      controller: codeController,
      onSaved: (newValue) => code = newValue!,
      //اعتبار سنجی فرم
      validator: (value) {
        if (value!.isEmpty) {
          return "Please add your code";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        labelText: "sms code",
      ),
    );
  }

  TextFormField buildNumberFormField() {
    return TextFormField(
      controller: phoneNumberController,
      onSaved: (newValue) => phone = newValue!,
      //اعتبار سنجی فرم
      validator: (value) {
        if (value!.isEmpty) {
          return "Please add your number";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        labelText: "phone number",
      ),
    );
  }
}
