import 'package:mobile_project/core/utils/api_service.dart';
import 'package:mobile_project/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  final ApiService apiService;

  ProfileRepo(this.apiService);

  Future<void> updateProfile({
    required String name,
    required String email,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<UserModel> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id');

    if (userId == null) {
      throw Exception('User ID not found. Please login again.');
    }

    final response = await apiService.get(
      endpoint: '/users/$userId',
    );

    return UserModel.fromJson(response);
  }

  Future<void> updateSettings() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
