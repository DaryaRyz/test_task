import 'package:flutter/material.dart';
import 'package:test_task_flutter/domain/bloc/dishes_bloc.dart';
import 'package:test_task_flutter/domain/models/dishes_category_data.dart';
import 'package:test_task_flutter/presentation/screens/category_screen/widgets/filter_item.dart';
import 'package:test_task_flutter/presentation/screens/category_screen/widgets/dish_card.dart';

class CategoryContent extends StatelessWidget {
  final DishesCategoryData data;
  final DishesBloc bloc;

  const CategoryContent({
    Key? key,
    required this.data,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: data.tags.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) => FilterItem(
              title: data.tags[index],
              isActive: data.selectedTag == data.tags[index],
              onTap: () => bloc.add(ChangeDishesFilterEvent(data.tags[index])),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: data.dishes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.74,
              crossAxisSpacing: 8,
              mainAxisSpacing: 14,
              crossAxisCount: 3,
            ),
            itemBuilder: (context, int index) => DishCard(meal: data.dishes[index]),
          ),
        ),
      ],
    );
  }
}
