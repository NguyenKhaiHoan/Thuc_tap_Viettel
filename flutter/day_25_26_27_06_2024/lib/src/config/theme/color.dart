import 'package:flutter/material.dart';

class HAppColor {
  static const Color whileColor = Color(0xffffffff);
  static const Color blackColor = Color(0xff000000);
  static const Color transparentColor = Colors.transparent;

  static const Color bluePrimaryColor = Color(0xff0084f3);
  static const Color blueSecondaryColor = Color(0xff4ab9ff);
  static const Color greyColor = Colors.grey;

  static const Color otherColor = Color(0xff090E17);
  static const Color anotherColor = Color(0xff303d4f);
}

var listColorsHome = [
  HAppColor.otherColor.withOpacity(0.3),
  HAppColor.otherColor.withOpacity(0.3),
  HAppColor.otherColor.withOpacity(0.3),
  HAppColor.otherColor,
  HAppColor.otherColor,
];

var listColorProcess = [
  HAppColor.otherColor,
  HAppColor.otherColor,
  HAppColor.otherColor,
  HAppColor.otherColor.withOpacity(.3)
];
