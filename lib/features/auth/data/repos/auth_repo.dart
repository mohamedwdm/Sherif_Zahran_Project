class AuthRepo {
  Future<void> login({required String email, required String password}) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String level,
  }) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> logout() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
