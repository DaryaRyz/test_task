import 'package:flutter/material.dart';
import 'package:test_task_flutter/domain/models/dish.dart';
import 'package:test_task_flutter/gen/assets.gen.dart';
import 'package:test_task_flutter/presentation/screens/category_screen/product_screen.dart';
import 'package:test_task_flutter/presentation/widgets/buttons/app_icon_button.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';
import 'package:test_task_flutter/presentation/widgets/app_dialog.dart';
import 'package:test_task_flutter/presentation/widgets/image_with_background.dart';

class DishCard extends StatelessWidget {
  final Dish dish;

  const DishCard({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppDialog.show(
        context,
        actions: [
          AppIconButton(
            icon: Assets.icons.favorite.svg(),
            onTap: () {
              //TODO: need to create a favorites logic
            },
          ),
        ],
        body: ProductScreen(dish: dish),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWithBackground(
            dish.imageUrl,
            height: (MediaQuery.of(context).size.width - 48) / 3,
          ),
          const SizedBox(height: 5),
          Text(
            dish.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.h4,
          ),
        ],
      ),
    );
  }
}
