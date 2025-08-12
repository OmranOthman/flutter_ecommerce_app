import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.fullName,
    required super.networkImage,
    required super.fullPhone,
    required super.email,
    required super.birthday,
    required super.gender,
    super.fileImage,
  });

  ProfileModel.fromEntity(ProfileEntity registerEntity)
      : this(
          fullName: registerEntity.fullName,
          networkImage: registerEntity.networkImage,
          fullPhone: registerEntity.fullPhone,
          email: registerEntity.email,
          gender: registerEntity.gender,
          birthday: registerEntity.birthday,
          fileImage: registerEntity.fileImage,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json['full_name'] ?? "",
      networkImage: json['avatar'] ?? "",
      email: json['email'] ?? "",
      fullPhone: json['full_phone'] ?? "",
      gender: json['gender'] ?? "",
      birthday: json['birthday'] ?? "",
    );
  }

  Future<FormData> toFormData() async{
    Map<String, dynamic> profileMap = {
      'full_name': fullName,
      // 'email': email,
      // 'full_phone': fullPhone,
      // 'gender': gender,
      // 'birthday': birthday,
    };
    if (fileImage != null) {
      profileMap['avatar'] = await MultipartFile.fromFile(
        fileImage!.path,
        filename: fileImage!.path,
      );
    }

    return FormData.fromMap(profileMap);
  }
}
