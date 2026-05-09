import 'package:flutter/material.dart';

import 'widgets/restaurants_bottom_nav_bar.dart';
import 'widgets/restaurants_categories.dart';
import 'widgets/restaurants_header.dart';
import 'widgets/restaurants_list.dart';
import 'widgets/restaurants_search.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFF8F5),
      body: SafeArea(
        child: Column(
          children: [
            RestaurantsHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RestaurantsSearch(),
                    RestaurantsCategories(),
                    RestaurantsList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RestaurantsBottomNavBar(),
    );
  }
}
