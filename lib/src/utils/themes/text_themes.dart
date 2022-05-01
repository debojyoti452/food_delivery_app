import 'package:flutter/material.dart';

class TextThemes {
  static late TextTheme _textTheme;
  static TextStyle? h11 = _textTheme.headline1;
  static TextStyle? h12 = _textTheme.headline2;
  static TextStyle? h14 = _textTheme.headline3;
  static TextStyle? h16 = _textTheme.headline4;
  static TextStyle? h18 = _textTheme.headline5;
  static TextStyle? h20 = _textTheme.headline6;
  static TextStyle? h24 = _textTheme.bodyText1;
  static TextStyle? h30 = _textTheme.bodyText2;
  static TextStyle? h32 = _textTheme.overline;
  TextThemes(BuildContext context) {
    _textTheme = Theme.of(context).textTheme;
  }
}
