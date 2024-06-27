import 'dart:ui';

import 'package:day_25_26_06_2024/src/config/theme/color.dart';
import 'package:day_25_26_06_2024/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class HAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HAppBar(
      {super.key, this.height = 80, this.leading, this.actions, this.title});

  final double height;
  final Widget? leading;
  final List<Widget>? actions;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: preferredSize.height,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 50),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: HAppColor.whileColor.withOpacity(0.15),
              ),
              child: AppBar(
                leading: Padding(
                  padding: hAppDefaultPaddingL,
                  child: CircleAvatar(child: leading ?? const SizedBox()),
                ),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: hAppDefaultPaddingR,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actions ?? []),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
