import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_details_model/collection_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/collection_vendors_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/filters_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/product_details_model/product_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/review_model/reviews_response_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/category_model/category_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/vendor_details_model/vendor_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/entities/review_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class VendorRemoteDataSource {
  Future<VendorDetailsModel> fetchVendorDetails(int vendorId);

  Future<ProductDetailsModel> fetchProductData(int productId);

  Future<CategoryModel> fetchCategoryDetails(int categoryId);

  Future<CollectionDetailsModel> fetchSubCollections(int id);

  Future<List<CollectionVendorModel>> fetchCollectionVendors(int id);

  Future<FiltersModel> fetchFilters();

  Future<List<ReviewEntity>> getProductReviews({required int productId});
  Future<void> toggleFavorite({
    required String type,
    required int id,
  });
  Future<void> addToCart({
    required int productId,
    required int quantity,
  });
  Future<void> addForceCart({
    required int productId,
    required int quantity,
  });

  Future<void> addProductReview({
    required int productId,
    required int rating,
    required String review,
  });
}

class VendorRemoteDataSourceImpl implements VendorRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  VendorRemoteDataSourceImpl(
      {required this.sharedPreferences, required this.dio});

  String? get token => sharedPreferences.getString(AppString.token);
  String? get language => sharedPreferences.getString(AppString.language);

  @override
  Future<VendorDetailsModel> fetchVendorDetails(int vendorId) async {
    Response response = await dio.get(
      "${AppString.apiUrl}vendor/$vendorId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return VendorDetailsModel.fromJson(response.data['data']);
    }
    throw ServerException();
  }

  @override
  Future<ProductDetailsModel> fetchProductData(int productId) async {
    Response response = await dio.get(
      "${AppString.apiUrl}products/$productId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return ProductDetailsModel.fromJson(response.data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CategoryModel> fetchCategoryDetails(int categoryId) async {
    final response = await dio.get(
      "${AppString.apiUrl}category/$categoryId",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return CategoryModel.fromJson(response.data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CollectionDetailsModel> fetchSubCollections(int id) async {
    Response response = await dio.get(
      "${AppString.apiUrl}collection/$id/sub-collections",
      options: Options(
        headers: {
          "Accept-Language": language,
          "Authorization": "Bearer $token",
        },
      ),
    );
    if (response.statusCode == 200) {
      return CollectionDetailsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CollectionVendorModel>> fetchCollectionVendors(int id) async {
    Response response =
        await dio.get("${AppString.apiUrl}collection/$id/vendors",
            options: Options(
              headers: {
                "Accept-Language": language,
                "Authorization": "Bearer $token",
              },
            ));
    if (response.statusCode == 200) {
      return (response.data['data'] as List)
          .map((e) => CollectionVendorModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FiltersModel> fetchFilters() async {
    Response response = await dio.get("${AppString.apiUrl}filters",
        options: Options(
          headers: {"Accept-Language": language},
        ));
    if (response.statusCode == 200) {
      return FiltersModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ReviewEntity>> getProductReviews({
    required int productId,
  }) async {
    final response = await dio.get(
      "${AppString.apiUrl}product-reviews/$productId",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      final model = ReviewsResponseModel.fromJson(response.data);
      return model.data.map((e) => e.toEntity()).toList();
    }
    throw ServerException();
  }

  @override
  Future<void> addProductReview({
    required int productId,
    required int rating,
    required String review,
  }) async {
    final response = await dio.post(
      "${AppString.apiUrl}review-product/$productId",
      data: {
        "rating": rating,
        "review": review,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<void> toggleFavorite({
    required String type,
    required int id,
  }) async {
    Response response = await dio.post(
      "${AppString.apiUrl}favorites/toggle/$type/$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
    Response response = await dio.post(
      "${AppString.apiUrl}cart",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
      data: {
        "purchasable_id": productId,
        "quantity": quantity,
      },
    );

    if (response.statusCode == 201) {
      return;
    }
    throw ServerException();
  }

  @override
  Future<void> addForceCart({
    required int productId,
    required int quantity,
  }) async {
    Response response = await dio.post(
      "${AppString.apiUrl}force-cart",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Accept-Language": language
        },
      ),
      data: {
        "purchasable_id": productId,
        "quantity": quantity,
      },
    );

    if (response.statusCode == 201) {
      return;
    }
    throw ServerException();
  }
}
