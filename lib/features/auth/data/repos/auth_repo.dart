import 'package:mobile_project/core/utils/api_service.dart';
import 'package:mobile_project/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiService apiService;

  AuthRepo(this.apiService);

  Future<UserModel> login({required String email, required String password}) async {
    final response = await apiService.post(
      endpoint: '/auth/login',
      body: {
        'email': email,
        'password': password,
      },
    );

    final user = UserModel.fromJson(response);
    
    if (user.userId != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('user_id', user.userId!);
      await prefs.setString('user_name', user.name ?? '');
    }
    
    return user;
  }

  Future<UserModel> signup({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String gender,
    required String level,
  }) async {
    // Map Level string to integer
    int levelInt = 1;
    if (level.contains('Level 1')) levelInt = 1;
    else if (level.contains('Level 2')) levelInt = 2;
    else if (level.contains('Level 3')) levelInt = 3;
    else if (level.contains('Level 4')) levelInt = 4;

    final response = await apiService.post(
      endpoint: '/auth/signup',
      body: {
        'name': name,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
        'gender': gender,
        'level': levelInt,
      },
    );

    return UserModel.fromJson(response);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id');
    await prefs.remove('user_name');
  }
}
