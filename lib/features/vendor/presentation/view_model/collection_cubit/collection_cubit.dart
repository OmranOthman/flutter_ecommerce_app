import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_details_model/collection_details_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/collection_vendors_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/data/models/collection_model/filters_model.dart';
import 'package:flutter_ecommerce_app/features/vendor/domain/repositories/vendor_repository.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final VendorRepository vendorRepository;

  CollectionCubit({required this.vendorRepository})
      : super(CollectionState.init());

  Future<void> loadSubCollections(int collectionId) async {
    emit(state.copyWith(isLoading: true));

    final result = await vendorRepository.getSubCollections(collectionId);

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        collectionDetails: result.dataResponse!,
      ));
    }
  }

  Future<void> loadCollectionVendors(int collectionId) async {
    emit(state.copyWith(isLoading: true));

    final result = await vendorRepository.getCollectionVendors(collectionId);

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        collectionVendors: result.dataResponse!,
      ));
    }
  }

  Future<void> loadFilters() async {
    emit(state.copyWith(isLoading: true));

    final ApiResult<FiltersModel, Failure> result =
        await vendorRepository.getFilters();

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        filters: result.dataResponse!,
      ));
    }
  }

  void toggleCuisineFilter(int cuisineId) {
    final currentSelected = List<int>.from(state.selectedCuisineIds);

    if (currentSelected.contains(cuisineId)) {
      currentSelected.remove(cuisineId);
    } else {
      currentSelected.add(cuisineId);
    }

    emit(state.copyWith(selectedCuisineIds: currentSelected));

    // لو أردت تحديث البائعين بناءً على الفلتر، أضف هنا:
    // loadCollectionVendorsWithFilters(currentSelected);
  }

  Future<void> toggleFavoriteInPromotion({
    required int vendorId,
    required int promotionId,
  }) async {
    emit(state.copyWith(isLoadingToggling: true));

    await vendorRepository
        .toggleVendorFavoriteInPromotion(
            vendorId: vendorId, promotionId: promotionId)
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            isLoadingToggling: false,
            errorMessageToggling: failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
              isLoadingToggling: false,
              collectionDetails: result.dataResponse));
        }
      },
    );
  }

  Future<void> toggleFavoriteInCollection({
    required int vendorId,
  }) async {
    emit(state.copyWith(isLoadingToggling: true));

    await vendorRepository
        .toggleVendorFavoriteInCollection(
      vendorId: vendorId,
    )
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            isLoadingToggling: false,
            errorMessageToggling: failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
              isLoadingToggling: false,
              collectionVendors: result.dataResponse));
        }
      },
    );
  }
}
