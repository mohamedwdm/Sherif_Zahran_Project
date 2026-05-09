import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/restaurants/data/repos/restaurant_repo.dart';
import 'features/restaurants/presentation/manager/restaurants_cubit.dart';
import 'features/restaurants/presentation/views/restaurants_screen.dart';

void main() {
  runApp(const FoodFinderApp());
}

class FoodFinderApp extends StatelessWidget {
  const FoodFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => RestaurantRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RestaurantsCubit(
              context.read<RestaurantRepo>(),
            )..loadRestaurants(),
          ),
        ],
        child: MaterialApp(
          title: 'FoodFinder',
          theme: AppTheme.lightTheme,
          home: const RestaurantsScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
