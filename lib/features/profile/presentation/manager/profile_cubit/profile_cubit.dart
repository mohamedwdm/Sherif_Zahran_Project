import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/features/profile/data/repos/profile_repo.dart';
import 'package:mobile_project/features/profile/data/models/order_model.dart';
import 'package:mobile_project/features/profile/data/models/payment_method_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  
  // Current user data stored in cubit
  String _name = 'Alex Thompson';
  String _email = 'alex.thompson@example.com';
  String _phone = '+1 (555) 0123-4567';

  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    emit(ProfileLoading());
    try {
      await profileRepo.updateProfile(name: name, email: email, phone: phone);
      
      // Update local variables
      _name = name;
      _email = email;
      _phone = phone;
      
      emit(ProfileSuccess(name: _name, email: _email, phone: _phone));
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }

  Future<void> getOrderHistory() async {
    emit(ProfileLoading());
    try {
      final orders = await profileRepo.getOrderHistory();
      emit(OrderHistorySuccess(orders: orders));
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }

  Future<void> getPaymentMethods() async {
    emit(ProfileLoading());
    try {
      final methods = await profileRepo.getPaymentMethods();
      emit(PaymentMethodsSuccess(methods: methods));
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }

  Future<void> updateSettings() async {
    emit(ProfileLoading());
    try {
      await profileRepo.updateSettings();
      // Emitting Success with current data to keep state consistent
      emit(ProfileSuccess(name: _name, email: _email, phone: _phone));
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }
}
