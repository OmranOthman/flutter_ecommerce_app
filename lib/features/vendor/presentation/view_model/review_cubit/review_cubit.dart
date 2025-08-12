import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/entities/review_entity.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/repositories/vendor_repository.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final VendorRepository vendorRepository;

  ReviewCubit({required this.vendorRepository}) : super(ReviewState.init());

  Future<void> loadProductReviews(int productId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final ApiResult<List<ReviewEntity>, Failure> result =
    await vendorRepository.getProductReviews(productId);

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        reviews: result.dataResponse!,
      ));
    }
  }
}
