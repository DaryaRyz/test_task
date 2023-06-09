import 'package:injectable/injectable.dart';
import 'package:test_task_flutter/data/dto/category_dto.dart';
import 'package:test_task_flutter/data/services/dio_client/i_dio_client.dart';
import 'package:test_task_flutter/data/services/routes.dart';
import 'package:test_task_flutter/domain/models/category.dart';
import 'package:test_task_flutter/domain/repository/i_category_repository.dart';

@Injectable(as: ICategoryRepository)
class CategoryRepository implements ICategoryRepository {
  final IDioClient _dioClient;

  CategoryRepository(this._dioClient);

  @override
  Future<List<Category>> getCategories() async {
    final response = await _dioClient.get(
      ApiConfig.generateRoute(Routes.getCategories),
    );
    final List categories = response.data['сategories'];
    return categories.map((e) => CategoryDto.toModel(CategoryDto.fromMap(e))).toList();
  }
}
