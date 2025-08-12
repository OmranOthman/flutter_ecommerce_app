// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      id: (json['id'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      review: json['review'] as String,
      createdAt: json['created_at'] as String,
      customer:
          CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'review': instance.review,
      'created_at': instance.createdAt,
      'customer': instance.customer,
    };
