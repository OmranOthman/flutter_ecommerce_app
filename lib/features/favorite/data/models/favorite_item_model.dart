import 'package:flutter_ecommerce_app/features/favorite/domain/entities/favorite_item_entity.dart';

class FavoriteItemModel extends FavoriteItemEntity {
 const  FavoriteItemModel({
    super.id,
    super.name,
    super.isFavorite,
    super.media,
    super.vendorId,
  });
  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) =>
      FavoriteItemModel(
        id: json['id'],
        name: json['name'],
        media: json['media'],
        isFavorite: true,
        vendorId: json['vendor_id'],
      );
}
