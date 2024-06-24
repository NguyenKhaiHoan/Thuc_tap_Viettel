import 'package:day_24_06_2024/config/theme/app_style.dart';
import 'package:day_24_06_2024/core/constants/constants_color.dart';
import 'package:flutter/material.dart';

class ListTagWidget extends StatelessWidget {
  final List<String> popularTags;
  const ListTagWidget({super.key, required this.popularTags});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (int index = 0; index < popularTags.length; index++)
          GestureDetector(
            child: Container(
                margin: const EdgeInsets.only(bottom: 10, right: 5),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: greyTertiaryColor,
                ),
                child: Text(
                  '#${popularTags[index]}',
                  style: label2Bold,
                )),
            onTap: () {},
          )
      ],
    );
  }
}
