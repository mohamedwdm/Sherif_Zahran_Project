import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../restaurants/data/repos/restaurant_repo.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final RestaurantRepo _restaurantRepo;
  final BehaviorSubject<String> _searchSubject = BehaviorSubject<String>();

  SearchCubit(this._restaurantRepo) : super(SearchInitial()) {
    _searchSubject.stream.distinct().listen(_performSearch);
  }

  void searchProduct(String productName) {
    _searchSubject.add(productName);
  }

  void _performSearch(String query) async {
    if (query.isEmpty ||
        query == 'All Categories' ||
        query == 'Select a product') {
      emit(SearchInitial());
      return;
    }

    emit(SearchSearching());

    try {
      final results = await _restaurantRepo.searchRestaurantsByProduct(query);

      if (results.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded(results));
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _searchSubject.close();
    return super.close();
  }
}
