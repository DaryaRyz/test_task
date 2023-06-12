import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final double borderRadius;
  final bool isActive;
  final VoidCallback onTap;

  const FilterItem({
    Key? key,
    required this.title,
    this.activeColor = ColorStyles.actionColor,
    this.inactiveColor = ColorStyles.mainItemColor,
    this.activeTextColor = ColorStyles.secondFontColor,
    this.inactiveTextColor = ColorStyles.primaryFontColor,
    this.borderRadius = 10,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: isActive ? activeColor : inactiveColor,
      ),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.h4.copyWith(
              color: isActive ? activeTextColor : inactiveTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
