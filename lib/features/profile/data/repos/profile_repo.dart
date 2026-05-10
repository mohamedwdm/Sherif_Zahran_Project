import '../models/order_model.dart';
import '../models/payment_method_model.dart';

class ProfileRepo {
  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> fetchUserData() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<List<OrderModel>> getOrderHistory() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      OrderModel(
        id: '#ORD-7281',
        restaurantName: 'The Golden Truffle',
        restaurantImage: 'https://images.unsplash.com/photo-1514933651103-005eec06c04b?w=400',
        date: DateTime.now().subtract(const Duration(days: 1)),
        totalPrice: 42.50,
        status: 'Completed',
        items: ['Truffle Pasta', 'Red Wine', 'Tiramisu'],
      ),
      OrderModel(
        id: '#ORD-6192',
        restaurantName: 'Sushi Zen',
        restaurantImage: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400',
        date: DateTime.now().subtract(const Duration(days: 3)),
        totalPrice: 28.00,
        status: 'Completed',
        items: ['Salmon Nigiri', 'Miso Soup'],
      ),
      OrderModel(
        id: '#ORD-5541',
        restaurantName: 'Burger Craft',
        restaurantImage: 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=400',
        date: DateTime.now().subtract(const Duration(days: 5)),
        totalPrice: 15.90,
        status: 'Cancelled',
        items: ['Double Cheese Burger', 'Fries'],
      ),
    ];
  }

  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      PaymentMethodModel(
        id: 'PM-1',
        type: 'Visa',
        lastFour: '4242',
        expiryDate: '12/25',
        isDefault: true,
      ),
      PaymentMethodModel(
        id: 'PM-2',
        type: 'Mastercard',
        lastFour: '8888',
        expiryDate: '09/24',
        isDefault: false,
      ),
    ];
  }

  Future<void> updateSettings() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
