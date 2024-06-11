import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton({
    super.key,
    required this.path,
    required this.onPressed,
    this.height,
  });

  final String path;
  final double? height;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      style: IconButton.styleFrom(
        elevation: 1,
        shadowColor: isDark ? null : Colors.grey[100],
        backgroundColor: Colors.white,
      ),
      highlightColor: Colors.grey[400],
      icon: SvgPicture.asset(
        path,
        height: height,
      ),
      onPressed: onPressed,
    );
  }
}
