// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pinshow_pro/Components/default_button.dart';
// import 'package:pinshow_pro/localization/language_constants.dart';
// import 'package:pinshow_pro/nework/send_sms_code_api.dart';
// import 'package:pinshow_pro/pages/Complete_form/sign_up_screen.dart';
// import 'package:pinshow_pro/size_config.dart';
//
// class OtpForm extends StatefulWidget {
//   const OtpForm({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _OtpFormState createState() => _OtpFormState();
// }
//
// class _OtpFormState extends State<OtpForm> {
//   final TextEditingController codeController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//
//   String? code;
//   String? phone;
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           SizedBox(height: SizeConfig.screenHeight * 0.15),
//           buildCodeFormField(),
//           buildNumberFormField(),
//           SizedBox(height: getScreenHeight(20)),
//           Text(
//             getTranslated(context, 'sms_verification_text_bottom_field')!,
//             style: const TextStyle(
//                 fontFamily: "assets/fonts/farsi/IRANYekanMobileMedium.ttf"),
//           ),
//           SizedBox(height: getScreenHeight(200)),
//           DefaultButton(
//             text: getTranslated(context, 'button_text')!,
//             press: () {
//               Navigator.pushNamed(context, SignUpScreen.routeName);
//               SendSmsCodeAPI.createSendSmsCode(
//                       phone.toString(), code.toString())
//                   .then((author) {
//                 return null;
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   TextFormField buildCodeFormField() {
//     return TextFormField(
//       controller: codeController,
//       onSaved: (newValue) => code = newValue!,
//       //اعتبار سنجی فرم
//       validator: (value) {
//         if (value!.isEmpty) {
//           return "Please add your code";
//         } else {
//           return null;
//         }
//       },
//       decoration: const InputDecoration(
//         labelText: "sms code",
//       ),
//     );
//   }
//
//   TextFormField buildNumberFormField() {
//     return TextFormField(
//       controller: phoneController,
//       onSaved: (newValue) => phone = newValue!,
//       onChanged: (value) {
//         setState(() {
//           phone = value;
//         });
//       },
//       //اعتبار سنجی فرم
//       validator: (value) {
//         if (value!.isEmpty) {
//           return getTranslated(context, 'add_number_error')!;
//         } else if (value.length < 10) {
//           return getTranslated(context, 'phone_number_to_short_error')!;
//         } else {
//           return null;
//         }
//       },
//       inputFormatters: [
//         LengthLimitingTextInputFormatter(10),
//       ],
//       decoration: InputDecoration(
//         labelText: getTranslated(context, 'phone_number_label')!,
//         suffixIcon: const Icon(Icons.call),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinshow_pro/Components/default_button.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/nework/send_sms_code_api.dart';
import 'package:pinshow_pro/pages/Complete_form/sign_up_screen.dart';
import 'package:pinshow_pro/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_builder/timer_builder.dart';

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
  final _formKey = GlobalKey<FormState>();
  late DateTime alert;
  String? code;
  String? phone;

  @override
  void initState() {
    super.initState();
    alert = DateTime.now().add(const Duration(minutes: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Container(
            margin: const EdgeInsets.all(30.0),
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: codeController,
              onSaved: (newValue) => code = newValue!,
              onChanged: (value) {
                setState(() {
                  code = value;
                });
              },
              //اعتبار سنجی فرم
              validator: (value) {
                if (value!.isEmpty) {
                  return getTranslated(context, 'add_sms_code_error')!;
                } else {
                  return null;
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
              ],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: getTranslated(context, 'sms_code_label')!,
                suffixIcon: const Icon(Icons.sms_failed_outlined),
              ),
            ),
          ),
          // buildPhoneNumberFormField(context),
          Divider(
            height: getScreenHeight(10),
            thickness: 3,
            color: Colors.black12,
          ),
          SizedBox(height: getScreenHeight(25)),
          TimerBuilder.scheduled(
            [alert],
            builder: (context) {
              // This function will be called once the alert time is reached
              var now = DateTime.now();
              var reached = now.compareTo(alert) >= 0;
              final textStyle = Theme.of(context).textTheme.headline6;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    !reached
                        ? TimerBuilder.periodic(const Duration(seconds: 1),
                            alignment: Duration.zero, builder: (context) {
                            // This function will be called every second until the alert time
                            var now = DateTime.now();
                            var remaining = alert.difference(now);
                            return Text(
                              formatDuration(remaining),
                              style: const TextStyle(color: Colors.black54),
                            );
                          })
                        : TextButton(
                            child: Text(
                              getTranslated(context, 'time_up_resend_code')!,
                              style: const TextStyle(
                                  color: Colors.deepOrangeAccent),
                            ),
                            onPressed: () {
                              debugPrint("didn't get code pressed");
                            },
                          ),
                  ],
                ),
              );
            },
          ),
          buildPhoneNumberFormField(context),
          SizedBox(height: getScreenHeight(160)),
          DefaultButton(
            text: getTranslated(context, 'button_text')!,
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Navigator.pushNamed(context, SignUpScreen.routeName);
                // SendSmsCodeAPI.createSendSmsCode(code.toString())
                SendSmsCodeAPI.createSendSmsCode(
                        code.toString(), phone.toString())
                    .then((author) {
                  return saveSmsCode();
                });
                debugPrint(phone);
                debugPrint(code);
              }
            },
          ),
        ],
      ),
    );
  }

  //گرفتن شماره تلفن کاربر
  TextFormField buildPhoneNumberFormField(BuildContext context) {
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

  void saveSmsCode() {
    Navigator.pushNamed(context, SignUpScreen.routeName);
  }
}

String formatDuration(Duration d) {
  String f(int n) {
    return n.toString().padLeft(2, '0');
  }

  // We want to round up the remaining time to the nearest second
  d += const Duration(microseconds: 999999);
  return "${f(d.inMinutes)}:${f(d.inSeconds % 60)}";
}
