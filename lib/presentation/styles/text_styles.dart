import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';

abstract class TextStyles {
  static const h1 = TextStyle(
    color: ColorStyles.primaryFontColor,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  static const h2 = TextStyle(
    color: ColorStyles.primaryFontColor,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static const h3 = TextStyle(
    color: ColorStyles.primaryFontColor,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const h4 = TextStyle(
    color: ColorStyles.primaryFontColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const h5 = TextStyle(
    color: ColorStyles.primaryFontColor,
    fontWeight: FontWeight.w500,
    fontSize: 10,
  );
}
