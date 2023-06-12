import 'package:test_task_flutter/domain/models/dish.dart';

class BagItem {
  final Dish dish;
  final int count;

  BagItem({
    required this.dish,
    this.count = 1,
  });

  BagItem copyWith({
    Dish? dish,
    int? count,
  }) {
    return BagItem(
      dish: dish ?? this.dish,
      count: count ?? this.count,
    );
  }

  @override
  bool operator ==(other) => other is BagItem && dish.id == other.dish.id;

  @override
  int get hashCode => dish.id.hashCode;
}
