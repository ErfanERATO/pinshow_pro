import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinshow_pro/Components/default_button.dart';
import 'package:pinshow_pro/Components/have_account_text.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/nework/phone_verify_api.dart';
import 'package:pinshow_pro/pages/Sms_verification/sms_screen.dart';
import 'package:pinshow_pro/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomVerifyForm extends StatefulWidget {
  const BottomVerifyForm({Key? key}) : super(key: key);

  @override
  _BottomVerifyFormState createState() => _BottomVerifyFormState();
}

class _BottomVerifyFormState extends State<BottomVerifyForm> {
  final TextEditingController phoneNumberController = TextEditingController();
  String? phoneNumber;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "ثبت‌نام",
                      style: TextStyle(
                        color: Color(0xFF3f51b5),
                        fontFamily:
                            ("assets/fonts/farsi/IRANYekanMobileBold.ttf"),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      controller: phoneNumberController,
                      onSaved: (newValue) => phoneNumber = newValue!,
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                      //اعتبار سنجی فرم
                      validator: (value) {
                        if (value!.isEmpty) {
                          return getTranslated(context, 'add_number_error')!;
                        } else if (value.length < 10) {
                          return getTranslated(
                              context, 'phone_number_to_short_error')!;
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        labelText:
                            getTranslated(context, 'phone_number_label')!,
                        suffixIcon: const Icon(Icons.call),
                        hintText: "9024040897",
                      ),
                    ),
                    SizedBox(height: getScreenHeight(60)),
                    DefaultButton(
                      text: getTranslated(context, 'button_text')!,
                      press: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Navigator.pushNamed(
                          //     context, SmsVerificationScreen.routeName)
                          // API.createPhoneVerify(phoneNumber!);
                          VerifyPhoneAPI.createPhoneVerify(
                                  phoneNumber.toString())
                              .then((author) {
                            return savePhone();
                          });
                        }
                      },
                    ),
                    SizedBox(height: getScreenHeight(20)),
                    const HaveAccountText(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void savePhone() {
    String phone = phoneNumberController.text;
    savePhoneNumber(phone).then((bool committed) {
      Navigator.pushNamed(context, SmsVerificationScreen.routeName);
    });
  }
}

Future<bool> savePhoneNumber(String phone) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("phone", phone);
  return prefs.commit();
}
