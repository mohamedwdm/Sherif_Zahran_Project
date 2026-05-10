import '../../../../core/models/product.dart';
import '../../../../core/models/restaurant.dart';
import '../../../../core/api/api_service.dart';

class RestaurantRepo {
  Future<List<Restaurant>> getRestaurants() async {
    try {
      final response = await ApiService.dio.get('/restaurants');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Restaurant.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getRestaurantProducts(int restaurantId) async {
    try {
      final response = await ApiService.dio.get('/restaurant-products/restaurant/$restaurantId/products');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Restaurant>> searchRestaurantsByProduct(String query) async {
    try {
      final response = await ApiService.dio.get('/restaurant-products/search', queryParameters: {
        'product_name': query,
      });
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Restaurant.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
