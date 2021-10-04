import 'package:flutter/material.dart';
import 'package:pinshow_pro/size_config.dart';

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getScreenWidth(15)),
    borderSide: const BorderSide(color: Color(0xff757575)),
  );
}