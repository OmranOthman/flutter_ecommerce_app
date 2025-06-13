import 'dart:io';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String username;
  final String email;
  final File? profileImage;

  ProfileLoaded({
    required this.username,
    required this.email,
    this.profileImage,
  });

  ProfileLoaded copyWith({
    String? username,
    String? email,
    File? profileImage,
  }) {
    return ProfileLoaded(
      username: username ?? this.username,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}