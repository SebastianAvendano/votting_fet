import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'DIN',
    primaryColor: ColorsAppTheme.primaryColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      brightness: Brightness.light,
      primary: ColorsAppTheme.primaryColor,
      secondary: ColorsAppTheme.secondColor,
    ),
  );
}
