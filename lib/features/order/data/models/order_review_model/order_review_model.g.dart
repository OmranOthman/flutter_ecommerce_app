// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderReviewModel _$OrderReviewModelFromJson(Map<String, dynamic> json) =>
    OrderReviewModel(
      id: (json['id'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      review: json['review'] as String,
      createdAt: json['created_at'] as String,
      customer:
          CustomerModel.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderReviewModelToJson(OrderReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'review': instance.review,
      'created_at': instance.createdAt,
      'customer': instance.customer,
    };

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
