import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/features/home/data/models/home_model.dart';
import 'package:flutter_ecommerce_app/features/home/domian/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeState());

  Future<void> loadHomeData() async {
    ApiResult<HomeModel, Failure> homeData = await homeRepository.getHomeData();
    
  }
}
