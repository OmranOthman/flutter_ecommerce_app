import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_ecommerce_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter_ecommerce_app/features/cart/data/datacources/cart_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/cart/data/datacources/cart_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter_ecommerce_app/features/checkout/data/datasources/checkout_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/checkout/data/datasources/checkout_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/checkout/data/repositories/checkout_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:flutter_ecommerce_app/features/favorite/data/datasources/favorites_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/favorite/data/datasources/favorites_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/favorite/data/repositories/favorites_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/favorite/domain/favorites_repository.dart';
import 'package:flutter_ecommerce_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/home/domian/repositories/home_repository.dart';
import 'package:flutter_ecommerce_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/features/location/data/datasources/location_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/location/data/datasources/location_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/location/data/repositories/location_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/location/domain/repositories/location_repository.dart';
import 'package:flutter_ecommerce_app/features/main/presentation/view_model/cubit/main_cubit.dart';
import 'package:flutter_ecommerce_app/features/new_card/data/datasources/payment_methods_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/new_card/data/datasources/payment_methods_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/new_card/data/repositories/payment_methods_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/new_card/domain/repositories/payment_methods_repository.dart';
import 'package:flutter_ecommerce_app/features/order/data/datasources/order_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/order/data/datasources/order_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/order/data/repositories/order_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/order/domain/repositories/order_repository.dart';
import 'package:flutter_ecommerce_app/features/product_details/data/datasources/product_details_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/product_details/data/datasources/product_details_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/product_details/data/repositories/product_details_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/product_details/domain/repositories/product_details_repository.dart';
import 'package:flutter_ecommerce_app/features/search/data/datasources/search_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/search/data/repositories/search_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/search/domain/repositories/search_repository.dart';
import 'package:flutter_ecommerce_app/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:flutter_ecommerce_app/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:flutter_ecommerce_app/features/settings/domain/repositories/settings_repository.dart';
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
    () => AuthLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>(),),
  );

  di.registerLazySingleton<CartLocalDataSource>(
      () => CartLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>(),),
  );

  di.registerLazySingleton<CheckoutLocalDataSource>(
      () => CheckoutLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>(),),
  );

  di.registerLazySingleton<FavoritesLocalDataSource>(
        () => FavoritesLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );

  di.registerLazySingleton<LocationLocalDataSource>(
        () => LocationLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );

  di.registerLazySingleton<PaymentMethodsLocalDataSource>(
        () => PaymentMethodsLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );

  di.registerLazySingleton<OrdersLocalDataSource>(
        () => OrdersLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );


  di.registerLazySingleton<ProductDetailsLocalDataSource>(
        () => ProductDetailsLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );

  di.registerLazySingleton<SearchLocalDataSource>(
        () => SearchLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );

  di.registerLazySingleton<SettingsLocalDataSource>(
        () => SettingsLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );

}

void initRemoteDataSource() {
  di.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(dio: di<Dio>()),
  );


  di.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<PaymentMethodsRemoteDataSource>(
    () => PaymentMethodsRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(dio: di<Dio>()),
  );

  di.registerLazySingleton<SettingsRemoteDataSource>(
    () => SettingsRemoteDataSourceImpl(dio: di<Dio>()),
  );

}

void initRepositories() {
  di.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(appLocalDataSource: di<AppLocalDataSource>()),
  );

  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authLocalDataSource: di<AuthLocalDataSource>(),
      authRemoteDataSource: di<AuthRemoteDataSource>(),
      networkInfo: di<NetworkInfo>(),
    ),
  );

  di.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
        homeRemoteDataSource: di<HomeRemoteDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
        remoteDataSource: di<CartRemoteDataSource>(),
        localDataSource: di<CartLocalDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepositoryImpl(
        remoteDataSource: di<CheckoutRemoteDataSource>(),
        localDataSource: di<CheckoutLocalDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(
        favoritesRemoteDataSource: di<FavoritesRemoteDataSource>(),
        favoritesLocalDataSource: di<FavoritesLocalDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
        remoteDataSource: di<LocationRemoteDataSource>(),
        localDataSource: di<LocationLocalDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<PaymentMethodsRepository>(
    () => PaymentMethodsRepositoryImpl(
        remoteDataSource: di<PaymentMethodsRemoteDataSource>(),
        localDataSource: di<PaymentMethodsLocalDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(
        remoteDataSource: di<OrdersRemoteDataSource>(),
        localDataSource: di<OrdersLocalDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<ProductDetailsRepository>(
    () => ProductDetailsRepositoryImpl(
        remoteDataSource: di<ProductDetailsRemoteDataSource>(),
        localDataSource: di<ProductDetailsLocalDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(
        remoteDataSource: di<SearchRemoteDataSource>(),
        localDataSource: di<SearchLocalDataSource>(),
        networkInfo: di<NetworkInfo>()),
  );

  di.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
        remoteDataSource: di<SettingsRemoteDataSource>(),
        localDataSource: di<SettingsLocalDataSource>(),
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
