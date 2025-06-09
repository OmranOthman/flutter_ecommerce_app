import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/ad_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/collection_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/home_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/popup_model.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/promotion_model.dart';
import 'package:flutter_ecommerce_app/features/home/domian/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;

  HomeCubit({
    required this.homeRepository,
  }) : super(HomeState.init());

  Future<void> loadHomeData() async {
    emit(state.copyWith(isLoading: true));

    ApiResult<HomeModel, Failure> result = await homeRepository.getHomeData();
    if (result.errorResponse != null) {
      emit(state.copyWith(
          isLoading: false,
          errorMessage: failureHandlingMessage(result.errorResponse!)));
    } else {
      emit(state.copyWith(
        promotions: result.dataResponse!.promotions ?? [],
        ads: result.dataResponse!.ads ?? [],
        collections: result.dataResponse!.collections ?? [],
        popup: result.dataResponse!.popup!,
        isLoading: false,
      ));
    }
  }
}
