import 'package:flutter/material.dart';
import 'package:lost_found_pet_prototype/theme/font_theme.dart';
import 'package:lost_found_pet_prototype/theme/theme_constant.dart';
import 'package:lost_found_pet_prototype/theme/widget_theme.dart';

ThemeData get kBrandTheme {
  final base = ThemeData.light();

  return base.copyWith(
//    brightness: Brightness.light,
    textTheme: buildTextTheme(base.textTheme),
    iconTheme: buildIconTheme(base.iconTheme),
    /**/
    primaryColor: kBrandRedColor,
    primaryColorBrightness: Brightness.dark,
    primaryTextTheme: buildTextTheme(base.primaryTextTheme),
    primaryIconTheme: buildIconTheme(base.accentIconTheme),
    /**/
    accentColor: kBrandYellowColor,
    accentColorBrightness: Brightness.dark,
    accentTextTheme: buildTextTheme(base.accentTextTheme),
    accentIconTheme: buildIconTheme(base.accentIconTheme),
    /**/
    scaffoldBackgroundColor: kBackgroundColor,

    appBarTheme: buildAppBarTheme(base.appBarTheme),
    buttonTheme: buildButtonTheme(base.buttonTheme),
    floatingActionButtonTheme: buildFabTheme(base.floatingActionButtonTheme),
    bottomAppBarTheme: buildBottomAppBarTheme(base.bottomAppBarTheme),
    tabBarTheme: buildTabBarTheme(base.tabBarTheme),
    cardTheme: buildCardTheme(base.cardTheme),
    inputDecorationTheme: buildInputDecorationTheme(base),
    colorScheme: buildColorScheme(),
  );
}
