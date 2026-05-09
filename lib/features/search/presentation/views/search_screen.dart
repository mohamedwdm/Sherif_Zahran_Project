import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../restaurants/data/repos/restaurant_repo.dart';
import '../manager/search_cubit.dart';
import '../../../../core/widgets/app_bottom_nav_bar.dart';

import 'widgets/search_header.dart';
import 'widgets/search_input_section.dart';
import 'widgets/search_results_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(context.read<RestaurantRepo>()),
      child: const Scaffold(
        backgroundColor: Color(0xFFFFF8F5),
        body: SafeArea(
          child: Column(
            children: [
              SearchHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      SearchInputSection(),
                      SearchResultsList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AppBottomNavBar(currentIndex: 1),
      ),
    );
  }
}
