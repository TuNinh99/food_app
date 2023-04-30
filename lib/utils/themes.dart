import 'package:flutter/material.dart';

const Color kColorPrimary = Color(0XFFFE724C);
const Color kColorWhite = Color(0XFFFFFFFF);
const Color kColorBlack = Color(0XFF000000);
const Color kColorLightBlack = Color(0XFF323643);
const Color kColorDarkerGray = Color(0XFF8C9099);
const Color kColorDarkGray = Color(0XFF767F9D);
const Color kColorDarklessGray = Color(0XFF9AA0B4);
const Color kColorGray = Color(0XFF8A8E9B);
const Color kColorLighterGray = Color(0XFF67666D);
const Color kColorLightGray = Color.fromARGB(255, 10, 12, 19);

class PrimaryFont {
  static String fontFamily = 'Sofia Pro';

  static TextStyle bold(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w900, fontSize: size);
  }

  static TextStyle semiBold(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w700, fontSize: size);
  }

  static TextStyle medium(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w500, fontSize: size);
  }

  static TextStyle light(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w300, fontSize: size);
  }

  static TextStyle extraLight(double size) {
    return TextStyle(
        fontFamily: fontFamily, fontWeight: FontWeight.w100, fontSize: size);
  }
}

extension GetSize on BuildContext {
  Size get size => MediaQuery.of(this).size;
}

extension GetOrientation on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
}
