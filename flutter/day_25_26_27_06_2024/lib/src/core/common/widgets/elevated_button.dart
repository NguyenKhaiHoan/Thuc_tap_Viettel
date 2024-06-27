import 'package:flutter/material.dart';

class HElevatedButton extends StatelessWidget {
  final double? width;
  final VoidCallback? onPressed;
  final Widget child;
  final double? radius;

  const HElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width = 15,
    this.radius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Colors.cyan, Colors.indigo],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
