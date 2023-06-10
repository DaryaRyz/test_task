import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/gen/assets.gen.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/widgets/app_loader.dart';

class ImagePreview extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;

  const ImagePreview({
    Key? key,
    this.imageUrl,
    this.width = double.maxFinite,
    this.height = 150,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              width: double.maxFinite,
              progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                color: Colors.grey,
                width: width,
                height: height,
                child: AppLoader(
                  value: downloadProgress.progress,
                  color: ColorStyles.lightLoadingColor,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: width,
                height: height,
                color: ColorStyles.borderColor,
                child: Center(
                  child: Assets.icons.imageError.svg(
                    width: 30,
                    colorFilter: const ColorFilter.mode(
                      ColorStyles.inactiveNavBarColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              fit: BoxFit.fill,
            ),
          )
        : Container(
            width: width,
            height: height,
            color: ColorStyles.borderColor,
          );
  }
}
