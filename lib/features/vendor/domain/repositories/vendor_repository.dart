import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_details_model/collection_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/collection_vendors_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/filters_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/product_details_model/product_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/category_model/category_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/vendor_details_model/vendor_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/entities/review_entity.dart';

abstract interface class VendorRepository {
  Future<ApiResult<VendorDetailsModel, Failure>> getVendorDetails(int vendorId);

  Future<ApiResult<ProductDetailsModel, Failure>> getProductDetails(
      int productId);

  Future<ApiResult<CategoryModel, Failure>> getCategoryDetails(int id);

  Future<ApiResult<CollectionDetailsModel, Failure>> getSubCollections(int id);

  Future<ApiResult<List<CollectionVendorModel>, Failure>> getCollectionVendors(
      int id);

  Future<ApiResult<FiltersModel, Failure>> getFilters();

  Future<ApiResult<List<ReviewEntity>, Failure>> getProductReviews(
      int productId);
  Future<ApiResult<VendorDetailsModel, Failure>> toggleFavoriteVender({
    required int vendorId,
  });
  Future<ApiResult<ProductDetailsModel, Failure>> toggleFavoriteProduct({
    required int productId,
  });
  Future<ApiResult<VendorDetailsModel, Failure>> toggleFavoriteProductInVendro({
    required int productId,
    required int categoryId,
  });

  Future<ApiResult<void, Failure>> addToCart({
    required int productId,
    required int quantity,
  });
  Future<ApiResult<void, Failure>> addForceCart({
    required int productId,
    required int quantity,
  });

  Future<ApiResult<CollectionDetailsModel, Failure>>
      toggleVendorFavoriteInPromotion(
          {required int vendorId, required int promotionId});
  Future<ApiResult<List<CollectionVendorModel>, Failure>>
      toggleVendorFavoriteInCollection({
    required int vendorId,
  });
}
