import 'package:day_24_06_2024/config/theme/app_style.dart';
import 'package:day_24_06_2024/core/constants/constants_color.dart';
import 'package:flutter/material.dart';

class TitleShowAll extends StatelessWidget {
  const TitleShowAll({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: heading3Style,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Show all',
            style: label2Bold.copyWith(color: bluePrimaryColor),
          ),
        )
      ],
    );
  }
}
