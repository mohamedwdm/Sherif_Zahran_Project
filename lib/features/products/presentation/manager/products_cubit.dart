import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/restaurant.dart';
import '../../../restaurants/data/repos/restaurant_repo.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final RestaurantRepo repo;

  ProductsCubit(this.repo) : super(ProductsInitial());

  Future<void> loadProducts(Restaurant restaurant) async {
    emit(ProductsLoading());
    try {
      final products = await repo.getRestaurantProducts(restaurant.id);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
