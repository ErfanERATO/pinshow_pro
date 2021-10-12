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
import 'package:pinshow_pro/Components/default_button.dart';
import 'package:pinshow_pro/constant.dart';
import 'package:pinshow_pro/localization/language_constants.dart';
import 'package:pinshow_pro/size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getScreenWidth(50),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getScreenWidth(50),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: getScreenWidth(50),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: getScreenWidth(50),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin5FocusNode),
                ),
              ),
              SizedBox(
                width: getScreenWidth(50),
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin6FocusNode),
                ),
              ),
              SizedBox(
                width: getScreenWidth(50),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          Divider(
            height: getScreenHeight(70),
            thickness: 3,
            color: Colors.black38,
          ),
          TextButton(
            child: Text(
              getTranslated(context, 'time_up_resend_code')!,
            ),
            onPressed: () {},
          ),
          SizedBox(height: getScreenHeight(200)),
          DefaultButton(
            text: getTranslated(context, 'button_text')!,
            press: () {},
          )
        ],
      ),
    );
  }
}
