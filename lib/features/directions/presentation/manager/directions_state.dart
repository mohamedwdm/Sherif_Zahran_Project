import 'package:equatable/equatable.dart';

abstract class DirectionsState extends Equatable {
  const DirectionsState();

  @override
  List<Object> get props => [];
}

class DirectionsInitial extends DirectionsState {}

class DirectionsLoading extends DirectionsState {}

class DirectionsLoaded extends DirectionsState {
  final double distance;
  final int estimatedTime;

  const DirectionsLoaded(this.distance, this.estimatedTime);

  @override
  List<Object> get props => [distance, estimatedTime];
}

class DirectionsError extends DirectionsState {
  final String message;

  const DirectionsError(this.message);

  @override
  List<Object> get props => [message];
}
