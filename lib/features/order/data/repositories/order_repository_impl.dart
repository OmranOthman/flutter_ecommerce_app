import 'package:dio/dio.dart';
import 'package:flutter_ecommerce_app/core/error/exceptions.dart';
import 'package:flutter_ecommerce_app/core/error/failures.dart';
import 'package:flutter_ecommerce_app/core/helper/api_helper/api_result.dart';
import 'package:flutter_ecommerce_app/core/helper/network/network_info.dart';
import 'package:flutter_ecommerce_app/features/order/data/datasources/order_remote_data_source.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_model/order_model.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_review_model/order_review_model.dart';
import 'package:flutter_ecommerce_app/features/order/domain/repositories/order_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource ordersRemoteDataSource;
  final NetworkInfo networkInfo;

  OrdersRepositoryImpl({
    required this.ordersRemoteDataSource,
    required this.networkInfo,
  });

  List<OrderModel>? _onGoingOrders;

  List<OrderModel>? _completedOrders;
  OrderModel? _orderModel;

  @override
  Future<ApiResult<List<OrderModel>, Failure>> getOnGoingOrders() async {
    if (await networkInfo.isConnected) {
      try {
        _onGoingOrders = await ordersRemoteDataSource.fetchOnGoingOrders();
        return ApiResult.withSuccess(_onGoingOrders!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<OrderModel>, Failure>> getCompletedOrder() async {
    if (await networkInfo.isConnected) {
      try {
        _completedOrders = await ordersRemoteDataSource.fetchCompletedOrder();
        return ApiResult.withSuccess(_completedOrders!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<OrderModel, Failure>> getOrderDetails(int orderId) async {
    if (await networkInfo.isConnected) {
      try {
        _orderModel = await ordersRemoteDataSource.fetchOrderDetails(orderId);
        return ApiResult.withSuccess(_orderModel!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<OrderModel, Failure>> pay(
      {required int orderId, required int paymentMethod}) async {
    if (await networkInfo.isConnected) {
      try {
        await ordersRemoteDataSource.pay(
            orderId: orderId, paymentMethod: paymentMethod);
        _orderModel = _orderModel!.copyWith(paymentStatus: "Paid");
        return ApiResult.withSuccess(_orderModel!);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (error) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<List<OrderReviewModel>, Failure>> getOrderReviews(int orderId) async {
    if (await networkInfo.isConnected) {
      try {
        final reviews = await ordersRemoteDataSource.fetchOrderReviews(orderId);
        return ApiResult.withSuccess(reviews);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

  @override
  Future<ApiResult<void, Failure>> addOrderReview({
    required int orderId,
    required int rating,
    required String review,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await ordersRemoteDataSource.addOrderReview(
          orderId: orderId,
          rating: rating,
          review: review,
        );
        return  ApiResult.withSuccess(null);
      } on DioException catch (error) {
        return ApiResult.withError(DioFailure(error: error));
      } on ServerException {
        return ApiResult.withError(ServerFailure());
      } catch (_) {
        return ApiResult.withError(UnknowFailure());
      }
    }
    return ApiResult.withError(InternetConnectionFailure());
  }

}
