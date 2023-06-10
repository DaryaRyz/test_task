import 'package:injectable/injectable.dart';
import 'package:test_task_flutter/data/dto/category_dto.dart';
import 'package:test_task_flutter/data/dto/dish_dto.dart';
import 'package:test_task_flutter/data/services/dio_client/i_dio_client.dart';
import 'package:test_task_flutter/data/services/routes.dart';
import 'package:test_task_flutter/domain/models/category.dart';
import 'package:test_task_flutter/domain/models/dish.dart';
import 'package:test_task_flutter/domain/repository/i_products_repository.dart';

@Injectable(as: IProductsRepository)
class ProductsRepository implements IProductsRepository {
  final IDioClient _dioClient;

  ProductsRepository(this._dioClient);

  @override
  Future<List<Category>> getCategories() async {
    final response = await _dioClient.get(
      ApiConfig.generateRoute(Routes.getCategories),
    );
    final List categories = response.data['сategories'];
    return categories.map((e) => CategoryDto.toModel(CategoryDto.fromMap(e))).toList();
  }

  @override
  Future<List<Dish>> getMeals() async {
    final response = await _dioClient.get(
      ApiConfig.generateRoute(Routes.getMeals),
    );
    final List categories = response.data['dishes'];
    return categories.map((e) => DishDto.toModel(DishDto.fromMap(e))).toList();
  }
}
