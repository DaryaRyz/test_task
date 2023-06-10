import 'package:flutter/material.dart';
import 'package:test_task_flutter/domain/models/dish.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';
import 'package:test_task_flutter/presentation/widgets/image_preview.dart';

class DishCard extends StatelessWidget {
  final Dish meal;

  const DishCard({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: (MediaQuery.of(context).size.width - 48) / 3,
          decoration: BoxDecoration(
            color: ColorStyles.mainItemColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: ImagePreview(imageUrl: meal.imageUrl),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          meal.name ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.h4,
        ),
      ],
    );
  }
}
