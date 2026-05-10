import 'package:dio/dio.dart';
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
    } on DioException catch (e) {
      String message = "Login failed";
      if (e.response?.data != null && e.response?.data is Map) {
        message = e.response?.data['detail'] ?? e.response?.data['message'] ?? message;
      }
      emit(AuthFailure(errMessage: message));
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String gender,
    required String level,
  }) async {
    emit(AuthLoading());
    try {
      await authRepo.signup(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        gender: gender,
        level: level,
      );
      emit(AuthSuccess());
    } on DioException catch (e) {
      String message = "Signup failed";
      if (e.response?.data != null) {
        // The backend returns strings directly for some errors according to docs
        if (e.response?.data is String) {
          message = e.response?.data;
        } else if (e.response?.data is Map) {
          message = e.response?.data['message'] ?? e.response?.data['detail'] ?? message;
        }
      }
      emit(AuthFailure(errMessage: message));
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authRepo.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(errMessage: e.toString()));
    }
  }
}
