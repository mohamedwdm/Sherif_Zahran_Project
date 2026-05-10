import '../api/api_service.dart';

class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final String? imgUrl = ApiService.fixUrl(json['image_url']);
    final defaultImage = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80';

    return Product(
      id: json['id'],
      name: json['name'],
      image: (imgUrl == null || imgUrl.isEmpty) ? defaultImage : imgUrl,
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? '',
    );
  }
}
