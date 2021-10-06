import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinshow_pro/Components/default_button.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/nework/send_sms_code_api.dart';
import 'package:pinshow_pro/pages/Complete_form/sign_up_screen.dart';
import 'package:pinshow_pro/size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? code;
  String? phone;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          buildCodeFormField(),
          buildNumberFormField(),
          SizedBox(height: getScreenHeight(20)),
          Text(
            getTranslated(context, 'sms_verification_text_bottom_field')!,
            style: const TextStyle(
                fontFamily: "assets/fonts/farsi/IRANYekanMobileMedium.ttf"),
          ),
          SizedBox(height: getScreenHeight(200)),
          DefaultButton(
            text: getTranslated(context, 'button_text')!,
            press: () {
              Navigator.pushNamed(context, SignUpScreen.routeName);
              SendSmsCodeAPI.createSendSmsCode(
                      phone.toString(), code.toString())
                  .then((author) {
                return null;
              });
            },
          )
        ],
      ),
    );
  }

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
      controller: phoneController,
      onSaved: (newValue) => phone = newValue!,
      onChanged: (value) {
        setState(() {
          phone = value;
        });
      },
      //اعتبار سنجی فرم
      validator: (value) {
        if (value!.isEmpty) {
          return getTranslated(context, 'add_number_error')!;
        } else if (value.length < 10) {
          return getTranslated(context, 'phone_number_to_short_error')!;
        } else {
          return null;
        }
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        labelText: getTranslated(context, 'phone_number_label')!,
        suffixIcon: const Icon(Icons.call),
      ),
    );
  }
}
