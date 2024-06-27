import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import '../../../config/theme/color.dart';

class HBlurCircleIcon extends StatelessWidget {
  final Icon icon;
  final Function()? onTap;

  const HBlurCircleIcon({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: GestureDetector(onTap: onTap, child: icon),
    );
  }
}
