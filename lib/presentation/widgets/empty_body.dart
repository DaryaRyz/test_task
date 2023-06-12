import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';

class EmptyBody extends StatelessWidget {
  final String text;

  const EmptyBody({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.black.withOpacity(0.4),
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: TextStyles.h3.copyWith(color: ColorStyles.primaryFontColor.withOpacity(0.65)),
            ),
          ],
        ),
      ),
    );
  }
}
