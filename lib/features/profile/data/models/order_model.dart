class OrderModel {
  final String id;
  final String restaurantName;
  final String restaurantImage;
  final DateTime date;
  final double totalPrice;
  final String status; // Completed, Pending, Cancelled
  final List<String> items;

  OrderModel({
    required this.id,
    required this.restaurantName,
    required this.restaurantImage,
    required this.date,
    required this.totalPrice,
    required this.status,
    required this.items,
  });
}
