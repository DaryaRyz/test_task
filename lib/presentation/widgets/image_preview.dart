import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/gen/assets.gen.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/widgets/app_loader.dart';

class ImagePreview extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  const ImagePreview({
    Key? key,
    this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl!,
              width: width,
              height: height,
              fit: fit,
              progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                color: ColorStyles.mainItemColor,
                width: width,
                height: height,
                child: AppLoader(
                  value: downloadProgress.progress,
                  color: ColorStyles.darkLoadingColor,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: width,
                height: height,
                color: ColorStyles.mainItemColor,
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
            ),
          )
        : Container(
            width: width,
            height: height,
            color: ColorStyles.mainItemColor,
          );
  }
}
