import 'package:test_task_flutter/domain/models/category.dart';

abstract class ICategoryRepository {
  Future<List<Category>> getCategories();
}
