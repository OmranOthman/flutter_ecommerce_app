import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/datasource/vendor_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_details_model/collection_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/collection_vendors_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/filters_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/category_model/category_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_promotion_model/collection_promotion_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/product_details_model/product_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/product_model/product_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/promotion_vendor_model/promotion_vendor_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/vendor_details_model/vendor_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/entities/review_entity.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/repositories/vendor_repository.dart';

class VendorRepositoryImpl implements VendorRepository {
  final VendorRemoteDataSource vendorRemoteDataSource;
  final NetworkInfo networkInfo;

  VendorRepositoryImpl({
    required this.vendorRemoteDataSource,
    required this.networkInfo,
  });
  VendorDetailsModel? _vendorDetailsModel;
  ProductDetailsModel? _productDetailsModel;
  CollectionDetailsModel? _collectionDetailsModel;
  List<CollectionVendorModel>? _collectionVendors;
  @override
  Future<ApiResult<VendorDetailsModel, Failure>> getVendorDetails(
      int vendorId) async {
    if (await networkInfo.isConnected) {
      try {
        _vendorDetailsModel =
            await vendorRemoteDataSource.fetchVendorDetails(vendorId);
        return ApiResult.withSuccess(_vendorDetailsModel!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<ProductDetailsModel, Failure>> getProductDetails(
      int productId) async {
    if (await networkInfo.isConnected) {
      try {
        _productDetailsModel =
            await vendorRemoteDataSource.fetchProductData(productId);
        return ApiResult.withSuccess(_productDetailsModel!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<CategoryModel, Failure>> getCategoryDetails(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await vendorRemoteDataSource.fetchCategoryDetails(id);
        return ApiResult.withSuccess(result);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<CollectionDetailsModel, Failure>> getSubCollections(
      int id) async {
    if (await networkInfo.isConnected) {
      try {
        _collectionDetailsModel =
            await vendorRemoteDataSource.fetchSubCollections(id);
        return ApiResult.withSuccess(_collectionDetailsModel!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<CollectionVendorModel>, Failure>> getCollectionVendors(
      int id) async {
    if (await networkInfo.isConnected) {
      try {
        _collectionVendors =
            await vendorRemoteDataSource.fetchCollectionVendors(id);
        return ApiResult.withSuccess(_collectionVendors!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<FiltersModel, Failure>> getFilters() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await vendorRemoteDataSource.fetchFilters();
        return ApiResult.withSuccess(result);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<ReviewEntity>, Failure>> getProductReviews(
      int productId) async {
    if (await networkInfo.isConnected) {
      try {
        final reviews = await vendorRemoteDataSource.getProductReviews(
          productId: productId,
        );
        return ApiResult.withSuccess(reviews);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    } else {
      return ApiResult.withError(InternetConnectionFailure());
    }
  }

  @override
  Future<ApiResult<VendorDetailsModel, Failure>> toggleFavoriteVender({
    required int vendorId,
  }) async {
    if (!await networkInfo.isConnected) {
      return ApiResult.withError(InternetConnectionFailure());
    }

    try {
      await vendorRemoteDataSource.toggleFavorite(id: vendorId, type: "vendor");
      _vendorDetailsModel = _vendorDetailsModel!.copyWith(
        isFavorite: !_vendorDetailsModel!.isFavorite!,
      );
      return ApiResult.withSuccess(_vendorDetailsModel!);
    } on DioException catch (error) {
      return ApiResult.withError(DioFailure(error: error));
    } on ServerException {
      return ApiResult.withError(ServerFailure());
    } catch (_) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<ProductDetailsModel, Failure>> toggleFavoriteProduct({
    required int productId,
  }) async {
    if (!await networkInfo.isConnected) {
      return ApiResult.withError(InternetConnectionFailure());
    }

    try {
      await vendorRemoteDataSource.toggleFavorite(
          id: productId, type: "product");
      _productDetailsModel = _productDetailsModel!.copyWith(
        isFavorite: !_productDetailsModel!.isFavorite!,
      );
      return ApiResult.withSuccess(_productDetailsModel!);
    } on DioException catch (error) {
      return ApiResult.withError(DioFailure(error: error));
    } on ServerException {
      return ApiResult.withError(ServerFailure());
    } catch (_) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<void, Failure>> addToCart(
      {required int productId, required int quantity}) async {
    if (!await networkInfo.isConnected) {
      return ApiResult.withError(InternetConnectionFailure());
    }

    try {
      await vendorRemoteDataSource.addToCart(
        productId: productId,
        quantity: quantity,
      );

      return ApiResult.withSuccess(null);
    } on DioException catch (error) {
      return ApiResult.withError(DioFailure(error: error));
    } on ServerException {
      return ApiResult.withError(ServerFailure());
    } catch (_) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<void, Failure>> addForceCart({
    required int productId,
    required int quantity,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await vendorRemoteDataSource.addForceCart(
            productId: productId, quantity: quantity);
        return ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<VendorDetailsModel, Failure>> toggleFavoriteProductInVendro({
    required int productId,
    required int categoryId,
  }) async {
    if (!await networkInfo.isConnected) {
      return ApiResult.withError(InternetConnectionFailure());
    }

    try {
      await vendorRemoteDataSource.toggleFavorite(
          id: productId, type: "product");
      int categoryIndex = _vendorDetailsModel!.categories!.indexWhere(
        (category) => category.id == categoryId,
      );

      int productIndex = _vendorDetailsModel!
          .categories![categoryIndex].products!
          .indexWhere((product) => product.id == productId);

      ProductModel product = _vendorDetailsModel!
          .categories![categoryIndex].products![productIndex];

      ProductModel updatedProduct = product.copyWith(
        isFavorite: !product.isFavorite!,
      );

      List<ProductModel> updatedProducts = List<ProductModel>.from(
        _vendorDetailsModel!.categories![categoryIndex].products!,
      )..[productIndex] = updatedProduct;

      CategoryModel updatedCategory =
          _vendorDetailsModel!.categories![categoryIndex].copyWith(
        products: updatedProducts,
      );

      List<CategoryModel> updatedCategories = List<CategoryModel>.from(
        _vendorDetailsModel!.categories!,
      )..[categoryIndex] = updatedCategory;

      _vendorDetailsModel = _vendorDetailsModel!.copyWith(
        categories: updatedCategories,
      );

      return ApiResult.withSuccess(_vendorDetailsModel!);
    } on DioException catch (error) {
      return ApiResult.withError(DioFailure(error: error));
    } on ServerException {
      return ApiResult.withError(ServerFailure());
    } catch (_) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<CollectionDetailsModel, Failure>>
      toggleVendorFavoriteInPromotion(
          {required int vendorId, required int promotionId}) async {
    if (!await networkInfo.isConnected) {
      return ApiResult.withError(InternetConnectionFailure());
    }

    try {
      await vendorRemoteDataSource.toggleFavorite(id: vendorId, type: "vendor");
      List<CollectionPromotionModel>? promotions =
          _collectionDetailsModel?.promotions;
      if (promotions != null) {
        int promotionIndex = promotions.indexWhere((p) => p.id == promotionId);
        if (promotionIndex != -1) {
          List<PromotionVendorModel>? vendors =
              promotions[promotionIndex].vendors;
          int vendorIndex = vendors!.indexWhere((v) => v.id == vendorId);
          if (vendorIndex != -1) {
            PromotionVendorModel current = vendors[vendorIndex];
            PromotionVendorModel updatedVendor = current.copyWith(
              isFavorite: !(current.isFavorite ?? false),
            );
            List<PromotionVendorModel> updatedVendors = List.of(vendors)
              ..[vendorIndex] = updatedVendor;

            CollectionPromotionModel updatedPromotion =
                promotions[promotionIndex].copyWith(
              vendors: updatedVendors,
            );
            List<CollectionPromotionModel> updatedPromotions =
                List.of(promotions)..[promotionIndex] = updatedPromotion;

            _collectionDetailsModel = _collectionDetailsModel!.copyWith(
              promotions: updatedPromotions,
            );
          }
        }
      }
      return ApiResult.withSuccess(_collectionDetailsModel!);
    } on DioException catch (error) {
      return ApiResult.withError(DioFailure(error: error));
    } on ServerException {
      return ApiResult.withError(ServerFailure());
    } catch (_) {
      return ApiResult.withError(UnknowFailure());
    }
  }

  @override
  Future<ApiResult<List<CollectionVendorModel>, Failure>>
      toggleVendorFavoriteInCollection({
    required int vendorId,
  }) async {
    if (!await networkInfo.isConnected) {
      return ApiResult.withError(InternetConnectionFailure());
    }

    try {
      await vendorRemoteDataSource.toggleFavorite(id: vendorId, type: "vendor");
      int? index =
          _collectionVendors?.indexWhere((vendor) => vendor.id == vendorId);

      if (index != null && index != -1) {
        CollectionVendorModel currentVendor = _collectionVendors![index];
        CollectionVendorModel updatedVendor = currentVendor.copyWith(
          isFavorite: !(currentVendor.isFavorite ?? false),
        );

        final updatedList =
            List<CollectionVendorModel>.from(_collectionVendors!)
              ..[index] = updatedVendor;

        _collectionVendors = updatedList;
      }
      return ApiResult.withSuccess(_collectionVendors!);
    } on DioException catch (error) {
      return ApiResult.withError(DioFailure(error: error));
    } on ServerException {
      return ApiResult.withError(ServerFailure());
    } catch (_) {
      return ApiResult.withError(UnknowFailure());
    }
  }
}
