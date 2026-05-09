import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/restaurant.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> loadProducts(Restaurant restaurant) async {
    emit(ProductsLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      emit(ProductsLoaded(restaurant.products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
