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
  
  di.registerLazySingleton<Dio>(
    () =>
        Dio()
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
          ),
  );

  initLocalDataSource();
  initRemoteDataSource();
  initRepositories();
  initBlocs();
}

void initLocalDataSource() {
  di.registerLazySingleton<AppLocalDataSource>(
    () => AppLocalDataSourceImpl(sharedPreferences: di<SharedPreferences>()),
  );

}

void initRemoteDataSource() {

 
}

void initRepositories() {
  di.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(appLocalDataSource: di<AppLocalDataSource>()),
  );


}

void initBlocs() {
  di.registerFactory<AppBloc>(
    () => AppBloc(appRepository: di<AppRepository>()),
  );

}
