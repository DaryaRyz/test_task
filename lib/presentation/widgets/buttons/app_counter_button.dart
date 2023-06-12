import 'package:flutter/material.dart';
import 'package:test_task_flutter/gen/assets.gen.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';

class AppCounterButton extends StatelessWidget {
  final int count;
  final VoidCallback onReduce;
  final VoidCallback onAdd;
  final double width;
  final double height;

  const AppCounterButton({
    Key? key,
    required this.count,
    required this.onReduce,
    required this.onAdd,
    this.width = 110,
    this.height = 35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height,
        color: ColorStyles.mainItemColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.transparent,
              child: SizedBox(
                width: width * 0.33,
                height: double.maxFinite,
                child: IconButton(
                  onPressed: onReduce,
                  style: IconButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                    ),
                  ),
                  icon: Center(child: Assets.icons.remove.svg()),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width * 0.33),
              child: Text(
                count.toString(),
                textAlign: TextAlign.center,
                style: TextStyles.h3,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: SizedBox(
                width: width * 0.33,
                height: double.maxFinite,
                child: IconButton(
                  onPressed: onAdd,
                  style: IconButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                    ),
                  ),
                  icon: Center(child: Assets.icons.add.svg()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
