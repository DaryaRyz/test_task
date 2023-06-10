import 'package:flutter/material.dart';
import 'package:test_task_flutter/domain/models/dish.dart';
import 'package:test_task_flutter/presentation/screens/category_screen/widgets/filter_item.dart';
import 'package:test_task_flutter/presentation/screens/category_screen/widgets/dish_card.dart';

class CategoryContent extends StatelessWidget {
  final List<Dish> meals;

  const CategoryContent({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: 20,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) => const FilterItem(
              title: 'title',
              isActive: true,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: meals.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.74,
              crossAxisSpacing: 8,
              mainAxisSpacing: 14,
              crossAxisCount: 3,
            ),
            itemBuilder: (context, int index) => DishCard(meal: meals[index]),
          ),
        ),
      ],
    );
  }
}
