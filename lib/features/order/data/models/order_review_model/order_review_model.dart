import 'package:json_annotation/json_annotation.dart';

part 'order_review_model.g.dart';

@JsonSerializable()
class OrderReviewModel {
  final int id;
  final int rating;
  final String review;

  @JsonKey(name: 'created_at')
  final String createdAt;

  final CustomerModel customer;

  OrderReviewModel({
    required this.id,
    required this.rating,
    required this.review,
    required this.createdAt,
    required this.customer,
  });

  factory OrderReviewModel.fromJson(Map<String, dynamic> json) =>
      _$OrderReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderReviewModelToJson(this);
}

@JsonSerializable()
class CustomerModel {
  final int id;
  final String name;

  CustomerModel({
    required this.id,
    required this.name,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);
}
