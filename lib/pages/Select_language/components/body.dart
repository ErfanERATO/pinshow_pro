import 'package:flutter/material.dart';
import 'package:pinshow_pro/Components/logo_with_text.dart';
import 'package:pinshow_pro/pages/Select_language/components/language_option.dart';
import 'package:pinshow_pro/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(double.infinity),
      decoration: const BoxDecoration(
        color: Color(0xFF3f51b5),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: getScreenHeight(240)),

          LogoWithText(),

          SizedBox(height: getScreenHeight(130)),

          const Expanded(
            child: LanguageOption(),
          ),
        ],
      ),
    );
  }
}

