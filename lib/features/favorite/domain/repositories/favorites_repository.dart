import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/entities/favorite_entity.dart';

abstract interface class FavoritesRepository {
  Future<ApiResult<FavoriteEntity, Failure>> getFavorite();
  Future<ApiResult<FavoriteEntity, Failure>> toggleFavorite({
    required int index,
    required String type,
    required int id,
  });
}
