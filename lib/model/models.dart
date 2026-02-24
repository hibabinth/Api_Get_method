class Product {
  final int id;
  final String title;
  final String category;
  final double price;
  final String image;
  final String description; // ← added
  final Rating? rating; // ← added

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.image,
    required this.description,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      description: json['description'] ?? '', // ← added
      rating:
          json['rating'] !=
              null // ← added
          ? Rating.fromJson(json['rating'])
          : null,
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: (json['rate'] as num).toDouble(), count: json['count']);
  }
}
