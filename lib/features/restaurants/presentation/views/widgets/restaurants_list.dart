import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/restaurants_cubit.dart';
import '../../manager/restaurants_state.dart';
import 'restaurant_card.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Rated Near You',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF251912),
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<RestaurantsCubit, RestaurantsState>(
            builder: (context, state) {
              if (state is RestaurantsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RestaurantsError) {
                return Center(child: Text(state.message));
              } else if (state is RestaurantsLoaded) {
                if (state.restaurants.isEmpty) {
                  return const Center(child: Text('No restaurants found.'));
                }
                return Column(
                  children: state.restaurants.map((restaurant) {
                    return RestaurantCard(restaurant: restaurant);
                  }).toList(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
