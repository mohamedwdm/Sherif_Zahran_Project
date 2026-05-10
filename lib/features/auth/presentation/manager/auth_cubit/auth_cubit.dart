import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepo.login(email: email, password: password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String level,
  }) async {
    emit(AuthLoading());
    try {
      await authRepo.signup(
        name: name,
        email: email,
        password: password,
        gender: gender,
        level: level,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authRepo.logout();
      emit(AuthInitial()); // Reset to initial state
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }
}
