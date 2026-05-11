import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' show cos, sqrt, asin, pi, pow, sin;
import '../../../../core/models/restaurant.dart';
import 'directions_state.dart';

class DirectionsCubit extends Cubit<DirectionsState> {
  DirectionsCubit() : super(DirectionsInitial());

  Future<void> loadDirections(Restaurant restaurant) async {
    emit(DirectionsLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      
      double calculatedDistance = restaurant.distance;

      // If restaurant has valid coordinates, calculate real distance from a mock user location
      if (restaurant.latitude != null && restaurant.longitude != null) {
        // Mock user location (e.g. Cairo)
        const double userLat = 30.0444;
        const double userLng = 31.2357;
        
        calculatedDistance = _calculateDistanceInKm(
            userLat, userLng, restaurant.latitude!, restaurant.longitude!);
      }

      // Convert distance to string with 1 decimal place, then back to double for clean UI
      final double finalDistance = double.parse(calculatedDistance.toStringAsFixed(1));
      
      // Assume average city driving speed of 30 km/h (which is 2 mins per km), plus 5 mins prep time
      final estimatedTime = (finalDistance * 2).round() + 5;
      
      emit(DirectionsLoaded(finalDistance, estimatedTime));
    } catch (e) {
      emit(DirectionsError(e.toString()));
    }
  }

  // Haversine formula to calculate distance between two coordinates in kilometers
  double _calculateDistanceInKm(double lat1, double lon1, double lat2, double lon2) {
    const double p = 0.017453292519943295; // Math.PI / 180
    final double a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)); // 2 * R; R = 6371 km
  }
}
