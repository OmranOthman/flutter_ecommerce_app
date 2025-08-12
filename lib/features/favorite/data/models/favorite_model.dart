import 'package:flutter_ecommerce_app/features/favorite/data/models/favorite_item_model.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  const FavoriteModel({
    super.products,
    super.vendors,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      vendors: json['vendors'] != null
          ? (json['vendors'] as List)
              .map((v) => FavoriteItemModel.fromJson(v))
              .toList()
          : null,
      products: json['products'] != null
          ? (json['products'] as List)
              .map((v) => FavoriteItemModel.fromJson(v))
              .toList()
          : null,
    );
  }
}
