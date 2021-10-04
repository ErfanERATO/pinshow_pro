import 'package:flutter/material.dart';
import 'package:pinshow_pro/pages/Select_language/components/body.dart';
import 'package:pinshow_pro/size_config.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);
  static String routeName = "/select_language";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
