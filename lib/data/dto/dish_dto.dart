import 'package:test_task_flutter/domain/models/dish.dart';

class DishDto {
  final int? id;
  final String? name;
  final double? price;
  final double? weight;
  final String? description;
  final String? imageUrl;
  final List tags;

  DishDto.fromMap(Map<String, dynamic> map)
      : id = map['id'] is int ? map['id'] : null,
        name = map['name'] is String ? map['name'] : null,
        price = DishDto.toDouble(map['price']),
        weight = DishDto.toDouble(map['weight']),
        description = map['description'] is String ? map['description'] : null,
        imageUrl = map['image_url'] is String ? map['image_url'] : null,
        tags = map['tegs'];

  static Dish toModel(DishDto dto) {
    return Dish(
      id: dto.id,
      name: dto.name,
      price: dto.price,
      weight: dto.weight,
      description: dto.description,
      imageUrl: dto.imageUrl,
      tags: dto.tags.map((e) => e.toString()).toList(),
    );
  }

  static double? toDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    }
    return null;
  }
}
