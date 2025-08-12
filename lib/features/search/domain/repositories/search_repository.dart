import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_model.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_product_model.dart';

abstract interface class SearchRepository {
  Future<ApiResult<List<SearchModel>, Failure>> search({
    int? collectionId,
    String? search,
  });
  Future<ApiResult<List<SearchProductModel>, Failure>> searchByVendor({
    int? vendorId,
    String? search,
  });
}
