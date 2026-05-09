import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/restaurant.dart';
import 'directions_state.dart';

class DirectionsCubit extends Cubit<DirectionsState> {
  DirectionsCubit() : super(DirectionsInitial());

  Future<void> loadDirections(Restaurant restaurant) async {
    emit(DirectionsLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      // Mock calculation
      final estimatedTime = (restaurant.distance * 5).round() + 5;
      emit(DirectionsLoaded(restaurant.distance, estimatedTime));
    } catch (e) {
      emit(DirectionsError(e.toString()));
    }
  }
}
