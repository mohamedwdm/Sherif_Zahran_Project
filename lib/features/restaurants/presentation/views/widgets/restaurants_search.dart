import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/restaurants_cubit.dart';

class RestaurantsSearch extends StatelessWidget {
  const RestaurantsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0C0AF)),
        ),
        child: TextField(
          onChanged: (value) => context.read<RestaurantsCubit>().search(value),
          decoration: const InputDecoration(
            hintText: 'Search restaurants or cuisines...',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ),
    );
  }
}
