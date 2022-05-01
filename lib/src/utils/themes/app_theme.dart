import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark();

  static ThemeData lightTheme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    splashColor: AppColors.primaryColor,
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: AppColors.primaryTextColor,
      selectionColor: AppColors.secondaryTextColor,
    ),
    backgroundColor: AppColors.backgroundColor,
    // inputDecorationTheme: inputDecorationTheme(false),
    iconTheme: const IconThemeData(color: AppColors.primaryTextColor),
    textTheme: GoogleFonts.comfortaaTextTheme().copyWith(
      headline1: _h11,
      headline2: _h12,
      headline3: _h14,
      headline4: _h16,
      headline5: _h18,
      headline6: _h20,
      bodyText1: _h12,
      bodyText2: _h14,
      overline: _h32,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors
          .secondaryColor, // on light theme surface = Colors.white by default
    ).copyWith(secondary: AppColors.secondaryColor),
  );

  static final TextStyle _h11 = TextStyle(
      fontSize: ScreenUtil().setSp(11),
      fontWeight: FontWeight.w400,
      color: AppColors.primaryTextColor);

  static final TextStyle _h12 = TextStyle(
    fontSize: ScreenUtil().setSp(12),
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static final TextStyle _h14 = TextStyle(
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: ScreenUtil().setSp(14),
  );

  static final TextStyle _h16 = TextStyle(
    fontSize: ScreenUtil().setSp(16),
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static final TextStyle _h18 = TextStyle(
    fontSize: ScreenUtil().setSp(18),
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static final TextStyle _h20 = TextStyle(
    fontSize: ScreenUtil().setSp(20),
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  static final TextStyle _h32 = TextStyle(
    fontSize: ScreenUtil().setSp(32),
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
  );

  AppTheme._();
}
