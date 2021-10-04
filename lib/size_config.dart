import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// گرفتن ارتفاع برا اساس صفحه نمایش
double getScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 سایزی هست که دیزاینر ها برای ارتفاع استفاده میکنن
  return (inputHeight / 812.0) * screenHeight;
}

// گرفتن عرض برا اساس صفحه نمایش
double getScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 سایزی هست که دیزاینر ها برای عرض استفاده میکنن
  return (inputWidth / 375.0) * screenWidth;
}
