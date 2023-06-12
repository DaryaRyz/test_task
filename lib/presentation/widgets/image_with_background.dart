import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/widgets/image_preview.dart';

class ImageWithBackground extends StatelessWidget {
  final double? height;
  final double? width;
  final String? imageUrl;

  const ImageWithBackground(
    this.imageUrl, {
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? (MediaQuery.of(context).size.width - 64) * 0.8,
      decoration: BoxDecoration(
        color: ColorStyles.mainItemColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: ImagePreview(imageUrl: imageUrl),
      ),
    );
  }
}
