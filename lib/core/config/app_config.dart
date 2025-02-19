import 'package:flutter/cupertino.dart';

class AppConfig {
  static late double sizeW;
  static late double sizeH;

  static const double designWidth = 375; // 기준 해상도 너비
  static const double designHeight = 812; // 기준 해상도 높이 (피그마 사이즈로 정의함)

  static void init(BuildContext context) {
    sizeW = MediaQuery.of(context).size.width;
    sizeH = MediaQuery.of(context).size.height;
  }

  static double w(double value) {
    return (sizeW / designWidth) * value;
  }

  static double h(double value) {
    return (sizeH / designHeight) * value;
  }

  static double r(double value) {
    return (sizeW / designWidth) * value; // 반응형 radius
  }
}