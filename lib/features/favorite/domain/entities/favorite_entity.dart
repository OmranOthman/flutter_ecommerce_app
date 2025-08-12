import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/entities/favorite_item_entity.dart';

class FavoriteEntity extends Equatable {
  final List<FavoriteItemEntity>? products;
  final List<FavoriteItemEntity>? vendors;
  const FavoriteEntity({
    this.products,
    this.vendors,
  });

  @override
  List<Object?> get props => [
        products,
        vendors,
      ];
}
