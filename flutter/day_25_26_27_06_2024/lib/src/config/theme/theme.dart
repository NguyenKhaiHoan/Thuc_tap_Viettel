import 'package:day_25_26_06_2024/src/core/constants/size.dart';
import 'package:flutter/material.dart';

import 'color.dart';
import 'style.dart';

class HAppTheme {
  final theme = ThemeData.dark(useMaterial3: false).copyWith(
      scaffoldBackgroundColor: HAppColor.otherColor,
      appBarTheme: AppBarTheme(
        backgroundColor: HAppColor.transparentColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: HAppColor.whileColor),
        titleTextStyle:
            HAppStyle.heading4Style.copyWith(color: HAppColor.whileColor),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        headlineLarge: HAppStyle.heading1Style,
        headlineMedium: HAppStyle.heading2Style,
        headlineSmall: HAppStyle.heading3Style,
        displayLarge: HAppStyle.heading4Style,
        displayMedium: HAppStyle.heading5Style,
        displaySmall: HAppStyle.paragraph1Bold,
        titleLarge: HAppStyle.paragraph2Bold,
        titleMedium: HAppStyle.paragraph3Bold,
        titleSmall: HAppStyle.label1Bold,
        bodyLarge: HAppStyle.label2Bold,
        bodyMedium: HAppStyle.label3Bold,
        bodySmall: HAppStyle.label4Bold,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle:
                  HAppStyle.label2Bold.copyWith(color: HAppColor.whileColor),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(
                  vertical: hAppDefaultPadding / 2,
                  horizontal: hAppDefaultPadding))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              textStyle:
                  HAppStyle.label2Bold.copyWith(color: HAppColor.whileColor),
              side: const BorderSide(color: HAppColor.bluePrimaryColor),
              backgroundColor: HAppColor.anotherColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(
                  vertical: hAppDefaultPadding / 2,
                  horizontal: hAppDefaultPadding))));
}
