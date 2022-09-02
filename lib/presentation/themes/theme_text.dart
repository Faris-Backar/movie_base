import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_base/presentation/themes/app_color.dart';
import 'package:sizer/sizer.dart';

class ThemeText {
  const ThemeText._();
  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadLine6 => _poppinsTextTheme.headline6!
      .copyWith(fontSize: 16.67.sp, color: Colors.white);
  static getTextTheme() => TextTheme(
        headline6: _whiteHeadLine6,
        subtitle1: whiteSubtitle1,
        bodyText2: whitebodyText2,
      );
  static TextStyle get whiteSubtitle1 => _poppinsTextTheme.subtitle1!
      .copyWith(fontSize: 16.sp, color: Colors.white);
  static TextStyle get whitebodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
      fontSize: 10.sp,
      color: Colors.white,
      letterSpacing: .25,
      wordSpacing: .25,
      height: 1.5);
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubText1 => subtitle1!.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );
  TextStyle get greySubtitle1 => subtitle1!.copyWith(
        color: Colors.grey,
      );
  TextStyle get violetHeadLine1 => subtitle1!.copyWith(
        color: AppColor.royalBlue,
      );
}
