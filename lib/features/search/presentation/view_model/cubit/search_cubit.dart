import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_model.dart';
import 'package:flutter_ecommerce_app/features/search/data/models/search_product_model.dart';
import 'package:flutter_ecommerce_app/features/search/domain/repositories/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepository searchRepository;
  SearchCubit({
    required this.searchRepository,
  }) : super(SearchState.init());

  void searchOnChanged(String search) {
    emit(state.copyWith(search: search));
  }

  Future<void> search({
    int? collectionId,
    String? search,
  }) async {
    emit(state.copyWith(isLoading: true));
    await searchRepository
        .search(
      search: search,
      collectionId: collectionId,
    )
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isLoading: false,
              errorMessage: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
              isLoading: false, searchModel: result.dataResponse));
        }
      },
    );
  }

  Future<void> searchByVendor({
    int? vendorId,
    String? search,
  }) async {
    emit(state.copyWith(isLoading: true));
    await searchRepository
        .searchByVendor(
      vendorId: vendorId,
      search: search,
    )
        .then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
              isLoading: false,
              errorMessage: failureHandlingMessage(
                result.errorResponse!,
              )));
        } else {
          emit(state.copyWith(
            isLoading: false,
            products: result.dataResponse,
          ));
        }
      },
    );
  }
}
