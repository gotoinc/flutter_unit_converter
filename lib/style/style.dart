import 'package:flutter/material.dart';
import 'package:unit_converter/style/consts/colors.dart';
import 'package:unit_converter/style/consts/dimensions.dart';

TextStyle appBarTitleTextStyle() {
  return TextStyle(
      fontSize: textSize4, color: textColor, letterSpacing: letterSpacingAppBarTitle);
}

TextStyle defaultTextStyle() {
  return TextStyle(
      color: textColor, fontSize: textSize3, letterSpacing: letterSpacing);
}

TextStyle dialogTextStyle() {
  return TextStyle(color: textColor, fontSize: textSize4);
}

TextStyle defaultHintTextStyle() {
  return TextStyle(
      color: textColor['hint'],
      fontSize: textSize3,
      letterSpacing: letterSpacing);
}

TextStyle defaultLabelTextStyle() {
  return TextStyle(
      color: textColor, fontSize: textSize3, letterSpacing: letterSpacing);
}
