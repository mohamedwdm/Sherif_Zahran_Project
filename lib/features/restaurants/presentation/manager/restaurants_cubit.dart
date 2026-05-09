import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/models/restaurant.dart';
import '../../data/repos/restaurant_repo.dart';
import 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  final RestaurantRepo _restaurantRepo;
  List<Restaurant> _allRestaurants = [];
  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();

  RestaurantsCubit(this._restaurantRepo) : super(RestaurantsInitial()) {
    _searchSubject.stream
        .debounceTime(const Duration(milliseconds: 300))
        .listen(_filterRestaurants);
  }

  Future<void> loadRestaurants() async {
    emit(RestaurantsLoading());
    try {
      _allRestaurants = await _restaurantRepo.getRestaurants();
      emit(RestaurantsLoaded(_allRestaurants));
    } catch (e) {
      emit(RestaurantsError(e.toString()));
    }
  }

  void search(String query) {
    _searchSubject.add(query);
  }

  void _filterRestaurants(String query) {
    if (_allRestaurants.isEmpty) return;
    
    if (query.isEmpty) {
      emit(RestaurantsLoaded(_allRestaurants));
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = _allRestaurants.where((restaurant) {
      return restaurant.name.toLowerCase().contains(lowerQuery) ||
             restaurant.category.toLowerCase().contains(lowerQuery);
    }).toList();

    emit(RestaurantsLoaded(filtered));
  }

  @override
  Future<void> close() {
    _searchSubject.close();
    return super.close();
  }
}
