import 'package:test_task_flutter/domain/models/category.dart';
import 'package:test_task_flutter/domain/models/dish.dart';

abstract class IProductsRepository {
  Future<List<Category>> getCategories();

  Future<List<Dish>> getMeals();
}
