import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';

class AppLoader extends StatelessWidget {
  final double size;

  const AppLoader({
    Key? key,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const Center(
        child: CircularProgressIndicator(
          color: ColorStyles.actionColor,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
