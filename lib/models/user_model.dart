class UserModel {
  final String id;
  final String username;
  final String email;
  final String? phoneNumber;
  final String? photoUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.phoneNumber,
    this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      photoUrl: json['photo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
    };
  }
}