import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String text,
    Color color = ColorStyles.actionColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    ShapeBorder? shape,
    SnackBarBehavior? behavior,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: color,
        elevation: elevation,
        behavior: behavior,
        margin: margin,
        shape: shape,
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
