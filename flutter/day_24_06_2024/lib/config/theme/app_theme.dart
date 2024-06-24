import 'package:day_24_06_2024/core/constants/constants_color.dart';
import 'package:flutter/material.dart';

import 'app_style.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: whiteColor,
    fontFamily: 'Nunito',
    appBarTheme: appBarTheme(),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      headlineLarge: heading1Style,
      headlineMedium: heading2Style,
      headlineSmall: heading3Style,
      displayLarge: heading4Style,
      displayMedium: heading5Style,
      displaySmall: paragraph1Bold,
      titleLarge: paragraph2Bold,
      titleMedium: paragraph3Bold,
      titleSmall: label1Bold,
      bodyLarge: label2Bold,
      bodyMedium: label3Bold,
      bodySmall: label4Bold,
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: whiteColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: greyPrimaryColor),
    titleTextStyle: TextStyle(color: greyPrimaryColor),
  );
}
