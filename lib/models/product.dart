class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : 0.0,
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
