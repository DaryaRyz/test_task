class Dish {
  final int? id;
  final String? name;
  final double? price;
  final double? weight;
  final String? description;
  final String? imageUrl;
  final List<String> tags;

  Dish({
    this.id,
    this.name,
    this.price,
    this.weight,
    this.description,
    this.imageUrl,
    required this.tags,
  });
}
