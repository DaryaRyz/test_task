import 'package:flutter/material.dart';
import 'package:test_task_flutter/domain/models/bag_item.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';
import 'package:test_task_flutter/presentation/styles/ui_util.dart';
import 'package:test_task_flutter/presentation/widgets/buttons/app_counter_button.dart';
import 'package:test_task_flutter/presentation/widgets/image_with_background.dart';

class BagItemWidget extends StatelessWidget {
  final BagItem item;
  final VoidCallback onReduce;
  final VoidCallback onAdd;

  const BagItemWidget({
    Key? key,
    required this.item,
    required this.onReduce,
    required this.onAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageWithBackground(
          item.dish.imageUrl,
          width: 62,
          height: 62,
        ),
        const SizedBox(width: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 109),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.dish.name ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyles.h4,
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: UiUtil.priceParse(item.dish.price), style: TextStyles.h4),
                    TextSpan(
                      text: ' · ${UiUtil.weightParse(item.dish.weight)}',
                      style: TextStyles.h4.copyWith(
                        color: ColorStyles.primaryFontColor.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        AppCounterButton(
          count: item.count,
          onReduce: onReduce,
          onAdd: onAdd,
        ),
      ],
    );
  }
}
