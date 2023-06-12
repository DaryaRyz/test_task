import 'package:test_task_flutter/domain/models/bag_item.dart';
import 'package:test_task_flutter/domain/models/dish.dart';

class BagItemDto {
  final int? id;
  final String? name;
  final double? price;
  final double? weight;
  final String? description;
  final String? imageUrl;
  final List<String> tags;
  final int count;

  BagItemDto.fromMap(Map map)
      : id = map['id'],
        name = map['name'],
        price = map['price'],
        weight = map['weight'],
        description = map['description'],
        imageUrl = map['imageUrl'],
        tags = map['tags'],
        count = map['count'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'weight': weight,
      'description': description,
      'imageUrl': imageUrl,
      'tags': tags,
      'count': count,
    };
  }

  BagItemDto.fromModel(BagItem model)
      : id = model.dish.id,
        name = model.dish.name,
        price = model.dish.price,
        weight = model.dish.weight,
        description = model.dish.description,
        imageUrl = model.dish.imageUrl,
        tags = model.dish.tags,
        count = model.count;

  static BagItem toModel(BagItemDto dto) {
    return BagItem(
      dish: Dish(
        id: dto.id,
        name: dto.name,
        price: dto.price,
        weight: dto.weight,
        description: dto.description,
        imageUrl: dto.imageUrl,
        tags: dto.tags,
      ),
      count: dto.count,
    );
  }
}
