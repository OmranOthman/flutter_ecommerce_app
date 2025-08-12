import 'package:flutter_ecommerce_app/features/vendor/data/models/product_model/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
   factory CategoryModel({
     int? id,
     String? title,
     String? media,
     List<dynamic>? children,
     List<ProductModel>? products,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
