import 'package:test_task_flutter/domain/models/category.dart';

class CategoryDto {
  final int? id;
  final String? name;
  final String? imageUrl;

  CategoryDto.fromMap(Map<String, dynamic> map)
      : id = map['id'] is int ? map['id'] : null,
        name = map['name'] is String ? map['name'] : null,
        imageUrl = map['image_url'] is String ? map['image_url'] : null;

  static Category toModel(CategoryDto dto) {
    return Category(
      id: dto.id,
      name: dto.name,
      imageUrl: dto.imageUrl,
    );
  }
}
