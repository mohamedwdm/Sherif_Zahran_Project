class UserModel {
  final int? userId;
  final String? name;
  final String message;

  UserModel({
    this.userId,
    this.name,
    required this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      name: json['name'],
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'message': message,
    };
  }
}
