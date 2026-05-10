import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/core/utils/api_service.dart';
import 'core/theme/app_theme.dart';
import 'features/restaurants/data/repos/restaurant_repo.dart';
import 'features/restaurants/presentation/manager/restaurants_cubit.dart';
import 'features/auth/presentation/views/login_view.dart';

import 'package:mobile_project/features/auth/data/repos/auth_repo.dart';
import 'package:mobile_project/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:mobile_project/features/profile/data/repos/profile_repo.dart';
import 'package:mobile_project/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';

void main() {
  runApp(const FoodFinderApp());
}

class FoodFinderApp extends StatelessWidget {
  const FoodFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ApiService(Dio())),
        RepositoryProvider(create: (context) => RestaurantRepo()),
        RepositoryProvider(
          create: (context) => AuthRepo(
            context.read<ApiService>(),
          ),
        ),
        RepositoryProvider(create: (context) => ProfileRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                RestaurantsCubit(context.read<RestaurantRepo>())
                  ..loadRestaurants(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(context.read<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => ProfileCubit(context.read<ProfileRepo>()),
          ),
        ],
        child: MaterialApp(
          title: 'FoodFinder',
          theme: AppTheme.lightTheme,
          home: const LoginView(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
