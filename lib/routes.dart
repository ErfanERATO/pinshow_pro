import 'package:flutter/material.dart';
import 'package:pinshow_pro/pages/Enter_option/enter_option_screen.dart';
import 'package:pinshow_pro/pages/Forget_password/forget_password_screen.dart';
import 'package:pinshow_pro/pages/HomePage/home_page_screen.dart';
import 'package:pinshow_pro/pages/Login/login_screen.dart';
import 'package:pinshow_pro/pages/Select_language/select_language.dart';
import 'package:pinshow_pro/pages/Complete_form/sign_up_screen.dart';
import 'package:pinshow_pro/pages/Sms_verification/sms_screen.dart';
import 'package:pinshow_pro/pages/verify_phone/verify_phone_2_screen.dart';


//مشخص کردن روت های هر صفحه
final Map<String , WidgetBuilder> routes = {
  EnterOption.routeName: (context) => const EnterOption(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SelectLanguage.routeName: (context) => const SelectLanguage(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  SmsVerificationScreen.routeName: (context) => const SmsVerificationScreen(),
  HomePage.routeName: (context) => const HomePage(),
  VerifyPhone2.routeName: (context) => const VerifyPhone2(),
};