import 'dart:io';

import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? fullName;
  final String? email;
  final String? networkImage;
  final File? fileImage;
  final String? fullPhone;
  final String? gender;
  final String? birthday;

  const ProfileEntity({
    this.fullName,
    this.email,
    this.networkImage,
    this.fileImage,
    this.fullPhone,
    this.gender,
    this.birthday,
  });

  ProfileEntity copyWith({
    String? fullName,
    String? email,
    String? networkImage,
    File? fileImage,
    String? fullPhone,
    String? gender,
    String? birthday,
  }) =>
      ProfileEntity(
          fullName: fullName ?? this.fullName,
          email: email ?? this.email,
          networkImage: networkImage ?? this.networkImage,
          fullPhone: fullPhone ?? this.fullPhone,
          gender: gender ?? this.gender,
          birthday: birthday ?? this.birthday,
          fileImage: fileImage ?? this.fileImage);

  @override
  List<Object?> get props => [
        fullName,
        email,
        networkImage,
        fullPhone,
        gender,
        birthday,
        fileImage,
      ];
}
