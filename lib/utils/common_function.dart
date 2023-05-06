// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

enum Screen_Type { SmallMobile, Mobile, Tablet, PC }

const int gSmallMobile = 375;
const int gMobile = 600;
const int gTablet = 1024;

Screen_Type gIsCheckingScreenSize(Size size) {
  if (size.width < gSmallMobile) return Screen_Type.SmallMobile;
  if (size.width >= gSmallMobile && size.width < gMobile) {
    return Screen_Type.Mobile;
  }
  if (size.width >= gMobile && size.width <= gTablet) {
    return Screen_Type.Tablet;
  } else {
    return Screen_Type.PC;
  }
}
