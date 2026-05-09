import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/core/models/restaurant.dart';
import 'package:mobile_project/features/products/presentation/manager/products_state.dart';
import '../../manager/products_cubit.dart';
import 'product_card.dart';

class ProductsList extends StatelessWidget {
  final Restaurant restaurant;

  const ProductsList({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsError) {
            return Center(child: Text(state.message));
          } else if (state is ProductsLoaded) {
            if (state.products.isEmpty) {
              return const Center(child: Text('No products available.'));
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: state.products[index],
                  restaurant: restaurant,
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
