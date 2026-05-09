import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/restaurant.dart';
import '../manager/directions_cubit.dart';
import 'widgets/directions_header.dart';
import 'widgets/directions_map_section.dart';
import 'widgets/directions_info_section.dart';
import 'widgets/directions_restaurant_summary.dart';
import 'widgets/directions_bottom_action_area.dart';

class DirectionsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const DirectionsScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DirectionsCubit()..loadDirections(restaurant),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8F5),
        body: SafeArea(
          child: Column(
            children: [
              const DirectionsHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const DirectionsMapSection(),
                      const SizedBox(height: 24),
                      const DirectionsInfoSection(),
                      const SizedBox(height: 24),
                      DirectionsRestaurantSummary(restaurant: restaurant),
                    ],
                  ),
                ),
              ),
              const DirectionsBottomActionArea(),
            ],
          ),
        ),
      ),
    );
  }
}
