import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/models/restaurant.dart';
import '../../../restaurants/data/repos/restaurant_repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final RestaurantRepo _restaurantRepo;
  List<Restaurant> _allRestaurants = [];
  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();

  SearchCubit(this._restaurantRepo) : super(SearchInitial()) {
    _loadData();
    
    _searchSubject.stream
        .distinct()
        .listen(_performSearch);
  }

  Future<void> _loadData() async {
    try {
      _allRestaurants = await _restaurantRepo.getRestaurants();
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void searchProduct(String productName) {
    _searchSubject.add(productName);
  }

  void _performSearch(String query) async {
    if (query.isEmpty || query == 'All Categories' || query == 'Select a product') {
      emit(SearchInitial());
      return;
    }

    emit(SearchSearching());
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    final lowerQuery = query.toLowerCase();
    final results = _allRestaurants.where((restaurant) {
      return restaurant.products.any((product) => 
          product.name.toLowerCase().contains(lowerQuery));
    }).toList();

    if (results.isEmpty) {
      emit(SearchEmpty());
    } else {
      emit(SearchLoaded(results));
    }
  }

  @override
  Future<void> close() {
    _searchSubject.close();
    return super.close();
  }
}
