import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinshow_pro/Components/default_button.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/size_config.dart';

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final TextEditingController phoneNumber2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          IntlPhoneField(),
          SizedBox(height: getScreenHeight(480)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
          ),
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
      initialCountryCode: "IR",
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      controller: phoneNumber2,
    );
  }
}
