import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/home/domian/repositories/home_repository.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/main/presentation/view_model/cubit/main_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter_ecommerce_app/app/data/datasources/app_local_data_source.dart';
import 'package:flutter_ecommerce_app/app/data/repositories/app_repository_impl.dart';
import 'package:flutter_ecommerce_app/app/domain/repositories/app_repository.dart';
import 'package:flutter_ecommerce_app/app/presentation/app_bloc/app_bloc.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

GetIt di = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerSingleton<SharedPreferences>(sharedPreferences);

  di.registerLazySingleton<InternetConnection>(() => InternetConnection());

  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(di<InternetConnection>()),
  );

  di.registerLazySingleton<Dio>(() => Dio()
    ..options.headers.addAll({
      "Accept": "application/json",
      "Accept-Language": "en",
    })
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        // filter: (options, args){
        //     // don't print requests with uris containing '/posts'
        //     if(options.path.contains('/posts')){
        //       return false;
        //     }
        //     // don't print responses with unit8 list data
        //     return !args.isResponse || !args.hasUint8ListData;
        //   }
      ),
    ));

  initLocalDataSource();
  initRemoteDataSource();
  initRepositories();
  initBlocs();
}

void initLocalDataSource() {
  di.registerLazySingleton<AppLocalDataSource>(
    () => AppLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );

  di.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );
}

void initRemoteDataSource() {
  di.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: di<Dio>()),
  );
}

void initRepositories() {
  di.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(appLocalDataSource: di<AppLocalDataSource>()),
  );

  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        authLocalDataSource: di<AuthLocalDataSource>(),
        authRemoteDataSource: di<AuthRemoteDataSource>()),
  );

  di.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
        homeRemoteDataSource: di<HomeRemoteDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );
}

void initBlocs() {
  di.registerSingleton<AppBloc>(
    AppBloc(
      appRepository: di<AppRepository>(),
    ),
  );

  di.registerFactory<AuthCubit>(
    () => AuthCubit(authRepository: di<AuthRepository>()),
  );

  di.registerFactory<MainCubit>(
    () => MainCubit(),
  );

  di.registerFactory<HomeCubit>(
    () => HomeCubit(homeRepository: di<HomeRepository>()),
  );
}
