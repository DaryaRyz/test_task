import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/domain/models/dish.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';
import 'package:test_task_flutter/presentation/styles/ui_util.dart';
import 'package:test_task_flutter/presentation/widgets/app_button.dart';
import 'package:test_task_flutter/presentation/widgets/image_preview.dart';

class ProductScreen extends StatelessWidget {
  final Dish dish;

  const ProductScreen({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: (MediaQuery.of(context).size.width - 64) * 0.8,
          decoration: BoxDecoration(
            color: ColorStyles.mainItemColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: ImagePreview(imageUrl: dish.imageUrl),
          ),
        ),
        const SizedBox(height: 8),
        Text(dish.name ?? '', style: TextStyles.h3),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: UiUtil.priceParse(dish.price), style: TextStyles.h4),
              TextSpan(
                text: ' · ${UiUtil.weightParse(dish.weight)}',
                style: TextStyles.h4.copyWith(
                  color: ColorStyles.primaryFontColor.withOpacity(0.4),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          dish.description ?? '',
          style: TextStyles.h3.copyWith(color: ColorStyles.primaryFontColor.withOpacity(0.65)),
        ),
        const SizedBox(height: 16),
        AppButton(
          title: 'addToBag'.tr(),
          onTap: () {},
        ),
      ],
    );
  }
}
