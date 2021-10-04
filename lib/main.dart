import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pinshow_pro/localization/demo_localization.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/pages/Enter_option/enter_option_screen.dart';
import 'package:pinshow_pro/routes.dart';

class MyHttpsOverrides extends HttpOverrides{
  HttpClient createHttpsClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  runApp(const Pinshow());
  HttpOverrides.global = MyHttpsOverrides();
}

class Pinshow extends StatefulWidget {
  const Pinshow({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _PinshowState? state = context.findAncestorStateOfType<_PinshowState>();
    state!.setLocale(newLocale);
  }


  @override
  _PinshowState createState() => _PinshowState();
}

class _PinshowState extends State<Pinshow> {

  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        //ایجاد تایتل برای اپ
        title: "پین‌شو",
        //حذف بنر دیباگ
        debugShowCheckedModeBanner: false,
        //ایجاد تم کلی برای اپ
        theme: ThemeData(
          // fontFamily: "assets/fonts/farsi/IRANYekanMobileMedium.ttf",
          primarySwatch: Colors.indigo,
        ),
        locale: _locale,
        supportedLocales: const [
          Locale("en", "US"),
          Locale("fa", "IR"),
        ],
        localizationsDelegates: const [
          DemoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        // initialRoute: EnterOption.routeName,
        initialRoute: EnterOption.routeName,
        routes: routes,
      );
    }
  }


