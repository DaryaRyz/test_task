import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';

class AppLoader extends StatelessWidget {
  final double size;
  final Color color;
  final double? value;

  const AppLoader({
    Key? key,
    this.size = 20,
    this.color = ColorStyles.darkLoadingColor,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          value: value,
          color: color,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
