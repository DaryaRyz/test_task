import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';

class ErrorBody extends StatelessWidget {
  final String errorText;
  final VoidCallback onTap;

  const ErrorBody({
    Key? key,
    required this.errorText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: ColorStyles.errorColor,
              size: 50,
            ),
            const SizedBox(height: 12),
            Text(
              errorText,
              style: TextStyles.h2,
            ),
          ],
        ),
      ),
    );
  }
}
