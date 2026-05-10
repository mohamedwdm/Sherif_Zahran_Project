import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/features/restaurants/data/repos/restaurant_repo.dart';
import '../../../../core/models/restaurant.dart';
import '../manager/products_cubit.dart';

import 'widgets/products_header.dart';
import 'widgets/restaurant_header.dart';
import 'widgets/products_list.dart';

class ProductsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const ProductsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(context.read<RestaurantRepo>())
            ..loadProducts(restaurant),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8F5),
        body: SafeArea(
          child: Column(
            children: [
              const ProductsHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      RestaurantHeader(restaurant: restaurant),
                      // const ProductsCategories(),
                      ProductsList(restaurant: restaurant),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
