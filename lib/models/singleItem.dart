class SingleItem {
  final int id;
  final String title;
  final int price;
  final String description;
  final Category category;
  final List<String> images;

  SingleItem({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory SingleItem.fromJson(Map<String, dynamic> json) {
    return SingleItem(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: Category.fromJson(json['category']),
      images: List<String>.from(json['images']),
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}
