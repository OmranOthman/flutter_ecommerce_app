import 'package:flutter_ecommerce_app/core/constants/app_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract interface class SearchLocalDataSource {
  Future<void> saveSearchQuery(String query);
  Future<List<String>> getSearchHistory();
  Future<void> clearSearchHistory();
}


class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const int _maxHistoryItems = 10;

  SearchLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> clearSearchHistory() {
    // TODO: implement clearSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getSearchHistory() {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<void> saveSearchQuery(String query) {
    // TODO: implement saveSearchQuery
    throw UnimplementedError();
  }


}