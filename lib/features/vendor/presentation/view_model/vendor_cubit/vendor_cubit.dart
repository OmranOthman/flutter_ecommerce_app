import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/category_model/category_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/vendor_details_model/vendor_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/repositories/vendor_repository.dart';

part 'vendor_state.dart';

class VendorCubit extends Cubit<VendorState> {
  final VendorRepository vendorRepository;

  VendorCubit({required this.vendorRepository}) : super(VendorState.init());

  void selectedCategory(CategoryModel category) {
    CategoryModel? matchedCategory =
        state.vendorDetails?.categories!.firstWhere(
      (c) => c.id == category.id,
      orElse: () => category,
    );

    emit(state.copyWith(selectedCategory: matchedCategory));
  }

  Future<void> loadVendorData(int vendorId) async {
    emit(state.copyWith(isLoading: true));

    ApiResult<VendorDetailsModel, Failure> result =
        await vendorRepository.getVendorDetails(vendorId);

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        selectedCategory: result.dataResponse!.categories!.first,
        vendorDetails: result.dataResponse!,
      ));
    }
  }

  Future<void> toggleFavoriteVender({
    required int vendorId,
  }) async {
    emit(state.copyWith(favoriteIsLoading: true));

    await vendorRepository.toggleFavoriteVender(vendorId: vendorId).then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            favoriteIsLoading: false,
            favoriteErrorMessage: failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            favoriteIsLoading: false,
            vendorDetails: result.dataResponse!,
          ));
        }
      },
    );
  }

  Future<void> toggleFavoriteProduct({
    required int productId,
    required int categoryId,
  }) async {
    emit(state.copyWith(favoriteProductIsLoading: true));

    await vendorRepository
        .toggleFavoriteProductInVendro(
            productId: productId, categoryId: categoryId)
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            favoriteProductIsLoading: false,
            favoriteProductErrorMessage:
                failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          int index = result.dataResponse!.categories!.indexWhere(
            (category) => category.id == categoryId,
          );
          emit(state.copyWith(
            favoriteProductIsLoading: false,
            selectedCategory: result.dataResponse!.categories![index],
            vendorDetails: result.dataResponse,
          ));
        }
      },
    );
  }
}
