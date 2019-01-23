import 'package:flutter/material.dart';
import 'package:unit_converter/style/consts/dimensions.dart';
import 'package:unit_converter/style/consts/colors.dart';

TextStyle defaultTextStyle() {
  return TextStyle(color: textColor, fontSize: textSize3, letterSpacing: letterSpacing);
}

TextStyle dialogTextStyle() {
  return TextStyle(color: textColor, fontSize: textSize4);
}

TextStyle defaultHintTextStyle() {
  return TextStyle(color: textColorHint, fontSize: textSize3, letterSpacing: letterSpacing);
}

TextStyle defaultLabelTextStyle() {
  return TextStyle(color: textColor, fontSize: textSize3, letterSpacing: letterSpacing);
}