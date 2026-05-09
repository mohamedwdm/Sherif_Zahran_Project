import 'package:equatable/equatable.dart';
import '../../../../core/models/restaurant.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchSearching extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Restaurant> results;

  const SearchLoaded(this.results);

  @override
  List<Object> get props => [results];
}

class SearchEmpty extends SearchState {}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}
