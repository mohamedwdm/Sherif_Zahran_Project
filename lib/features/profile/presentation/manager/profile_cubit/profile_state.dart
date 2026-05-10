part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final String name;
  final String email;
  final String phone;

  ProfileSuccess({
    required this.name,
    required this.email,
    required this.phone,
  });
}

class OrderHistorySuccess extends ProfileState {
  final List<OrderModel> orders;
  OrderHistorySuccess({required this.orders});
}

class PaymentMethodsSuccess extends ProfileState {
  final List<PaymentMethodModel> methods;
  PaymentMethodsSuccess({required this.methods});
}

class ProfileFailure extends ProfileState {
  final String errMessage;
  ProfileFailure({required this.errMessage});
}
