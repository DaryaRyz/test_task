import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final Color color;

  const AppIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.color = ColorStyles.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
