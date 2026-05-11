import '../api/api_service.dart';
import 'product.dart';

class Restaurant {
  final int id;
  final String name;
  final String image;
  final double rating;
  final List<Product> products;
  final String category;
  final double distance;
  final String address;
  final int deliveryTimeMin;
  final int deliveryTimeMax;
  final double deliveryFee;
  final double? latitude;
  final double? longitude;

  Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.products,
    this.category = 'All',
    this.distance = 0.0,
    this.address = '',
    this.deliveryTimeMin = 20,
    this.deliveryTimeMax = 30,
    this.deliveryFee = 0.0,
    this.latitude,
    this.longitude,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    final String? imgUrl = ApiService.fixUrl(json['image_url']);
    final defaultImage = 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80';

    return Restaurant(
      id: json['id'],
      name: json['name'],
      image: (imgUrl == null || imgUrl.isEmpty) ? defaultImage : imgUrl,
      rating: 4.5, // Not provided by the API, mockup
      products: [], // Loaded separately later
      address: json['address'] ?? '',
      category: 'Food',
      distance: 2.5,
      deliveryTimeMin: 20,
      deliveryTimeMax: 30,
      deliveryFee: 0.0,
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
    );
  }
}
