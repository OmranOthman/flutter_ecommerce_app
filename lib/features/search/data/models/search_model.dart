import 'package:flutter_ecommerce_app/features/search/data/models/search_product_model.dart';

class SearchModel {
  int? id;
  String? name;
  String? media;
  int? rating;
  List<SearchProductModel>? products;
  SearchModel({
    this.id,
    this.name,
    this.rating,
    this.media,
    this.products,
  });

    factory SearchModel.fromJson(Map<String, dynamic> json) =>
      SearchModel(
        id: (json['id'] as num?)?.toInt(),
        name: json['name'] as String?,
        media: json['media'],
        rating: json['rating'],
        products: (json['products'] as List<dynamic>?)
          ?.map((e) => SearchProductModel.fromJson(e as Map<String, dynamic>))
          .toList()
      );
}
