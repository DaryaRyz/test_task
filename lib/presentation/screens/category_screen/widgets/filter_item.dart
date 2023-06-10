import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final bool isActive;

  const FilterItem({
    Key? key,
    required this.title,
    this.activeColor = ColorStyles.actionColor,
    this.inactiveColor = ColorStyles.mainItemColor,
    this.activeTextColor = ColorStyles.secondFontColor,
    this.inactiveTextColor = ColorStyles.primaryFontColor,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isActive ? activeColor : inactiveColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          title,
          style: TextStyles.h4.copyWith(
            color: isActive ? activeTextColor : inactiveTextColor,
          ),
        ),
      ),
    );
  }
}
