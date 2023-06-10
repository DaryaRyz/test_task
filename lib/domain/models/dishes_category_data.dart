import 'package:test_task_flutter/domain/models/dish.dart';

class DishesCategoryData {
  final List<Dish> dishes;
  final List<String> tags;
  final String selectedTag;

  DishesCategoryData({
    required this.dishes,
    required this.tags,
    required this.selectedTag,
  });
}
