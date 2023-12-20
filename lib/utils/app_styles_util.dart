import 'package:flutter/material.dart';

class AppStylesUtil {
  static TextStyle? textBoldStyle(
          double size, Color textColor, FontWeight? weight) =>
      TextStyle(
        fontSize: size,
        fontFamily: 'SourceSans3',
        color: textColor,
        fontWeight: weight ?? FontWeight.w700,
      );

  static TextStyle? textSemiBoldStyle(
          double size, Color textColor, FontWeight? weight) =>
      TextStyle(
        fontSize: size,
        fontFamily: 'SourceSans3',
        color: textColor,
        fontWeight: weight ?? FontWeight.w600,
      );

  static TextStyle? textMediumStyle(
          double size, Color textColor, FontWeight? weight) =>
      TextStyle(
        fontSize: size,
        fontFamily: 'SourceSans3',
        color: textColor,
        fontWeight: weight ?? FontWeight.w500,
      );

  static TextStyle? textRegularStyle(
          double size, Color textColor, FontWeight? weight) =>
      TextStyle(
        fontSize: size,
        fontFamily: 'SourceSans3',
        color: textColor,
        fontWeight: weight ?? FontWeight.w400,
      );
}
