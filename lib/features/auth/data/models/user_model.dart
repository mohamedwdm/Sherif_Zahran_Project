class UserModel {
  final int? userId;
  final String? name;
  final String? email;

  final String message;

  UserModel({
    this.userId,
    this.name,
    this.email,

    required this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] ?? json['id'],
      name: json['name'] ?? json['full_name'],
      email: json['email'],
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'email': email,
      'message': message,
    };
  }
}
