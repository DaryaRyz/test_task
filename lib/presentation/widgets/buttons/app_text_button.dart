import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';
import 'package:test_task_flutter/presentation/widgets/app_loader.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final double borderRadius;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final bool isLoading;

  const AppTextButton({
    Key? key,
    this.title = '',
    this.borderRadius = 10,
    this.onTap,
    this.backgroundColor = ColorStyles.primaryButtonColor,
    this.titleColor = ColorStyles.secondFontColor,
    this.width = double.maxFinite,
    this.height = 48,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      child: TextButton(
        onPressed: isLoading ? null : onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: isLoading
            ? const AppLoader()
            : Center(
                child: Text(
                  title,
                  style: TextStyles.h3.copyWith(color: titleColor),
                ),
              ),
      ),
    );
  }
}
