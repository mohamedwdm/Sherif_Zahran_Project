import '../../../../core/models/restaurant.dart';
import '../../../../core/utils/mock_data.dart';

class RestaurantRepo {
  Future<List<Restaurant>> getRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return MockData.restaurants;
  }
}
