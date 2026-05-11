import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/features/profile/data/repos/profile_repo.dart';


part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;
  
  // Current user data stored in cubit
  String _name = 'Alex Thompson';
  String _email = 'alex.thompson@example.com';


  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  Future<void> updateProfile({
    required String name,
    required String email,
  }) async {
    emit(ProfileLoading());
    try {
      await profileRepo.updateProfile(name: name, email: email);
      
      // Update local variables
      _name = name;
      _email = email;
      
      emit(ProfileSuccess(name: _name, email: _email));
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }


  Future<void> fetchUserData() async {
    emit(ProfileLoading());
    try {
      final user = await profileRepo.fetchUserData();
      
      _name = user.name ?? _name;
      _email = user.email ?? _email;
      
      emit(ProfileSuccess(name: _name, email: _email));
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }

  Future<void> updateSettings() async {
    emit(ProfileLoading());
    try {
      await profileRepo.updateSettings();
      // Emitting Success with current data to keep state consistent
      emit(ProfileSuccess(name: _name, email: _email));
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }
}
