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
  });
}
