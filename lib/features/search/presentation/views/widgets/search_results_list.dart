import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/search_cubit.dart';
import '../../manager/search_state.dart';
import 'search_result_card.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSearching) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchError) {
            return Center(child: Text(state.message));
          } else if (state is SearchEmpty) {
            return const Center(
              child: Text('No restaurants found for this product.'),
            );
          } else if (state is SearchLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${state.results.length} places found',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.results.length,
                  itemBuilder: (context, index) {
                    return SearchResultCard(restaurant: state.results[index]);
                  },
                ),
              ],
            );
          }
          return const Center(child: Text('Select a product and search.'));
        },
      ),
    );
  }
}
