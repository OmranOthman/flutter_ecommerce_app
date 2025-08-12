import 'package:flutter_ecommerce_app/features/vendor/domain/entities/review_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'customer_model.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final int id;
  final int rating;
  final String review;

  @JsonKey(name: 'created_at')
  final String createdAt;

  final CustomerModel customer;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.review,
    required this.createdAt,
    required this.customer,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      rating: rating,
      review: review,
      createdAt: createdAt,
      customerName: customer.name,
    );
  }
}
