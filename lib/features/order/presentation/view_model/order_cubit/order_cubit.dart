import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/core/error/error_handling.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_model/order_model.dart';
import 'package:flutter_ecommerce_app/features/order/data/models/order_review_model/order_review_model.dart';
import 'package:flutter_ecommerce_app/features/order/domain/repositories/order_repository.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrdersRepository ordersRepository;
  OrderCubit({
    required this.ordersRepository,
  }) : super(OrderState.init());

  Future<void> loadOnGoingOrders() async {
    emit(state.copyWith(isLoadingOnGoingOrders: true));

    await ordersRepository.getOnGoingOrders().then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            isLoadingOnGoingOrders: false,
            errorMessageOnGoingOrders:
                failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            isLoadingOnGoingOrders: false,
            onGoingOrders: result.dataResponse!,
          ));
        }
      },
    );
  }

  Future<void> loadCompletedOrders() async {
    emit(state.copyWith(isLoadingCompletedOrders: true));

    await ordersRepository.getCompletedOrder().then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            isLoadingCompletedOrders: false,
            errorMessageCompletedOrders:
                failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            isLoadingCompletedOrders: false,
            completedOrders: result.dataResponse!,
          ));
        }
      },
    );
  }

  Future<void> loadOrderDetails(int orderId) async {
    emit(state.copyWith(isLoadingOrderDetails: true));

    await ordersRepository.getOrderDetails(orderId).then(
      (result) {
        if (result.errorResponse != null) {
          emit(state.copyWith(
            isLoadingOrderDetails: false,
            errorMessageOrderDetails:
                failureHandlingMessage(result.errorResponse!),
          ));
        } else {
          emit(state.copyWith(
            isLoadingOrderDetails: false,
            orderModel: result.dataResponse!,
          ));
        }
      },
    );
  }

 

 

  Future<void> loadOrderReviews(int orderId) async {
    emit(state.copyWith(isLoadingOrderReviews: true, errorMessageOrderReviews: null));

    final result = await ordersRepository.getOrderReviews(orderId);
    if (result.errorResponse != null) {
      emit(state.copyWith(
        isLoadingOrderReviews: false,
        errorMessageOrderReviews: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      emit(state.copyWith(
        isLoadingOrderReviews: false,
        orderReviews: result.dataResponse!,
      ));
    }
  }


  Future<void> submitOrderReview({
    required int orderId,
    required int rating,
    required String review,
  }) async {
    emit(state.copyWith(isSubmittingReview: true, errorMessageSubmitReview: null));

    final result = await ordersRepository.addOrderReview(
      orderId: orderId,
      rating: rating,
      review: review,
    );

    if (result.errorResponse != null) {
      emit(state.copyWith(
        isSubmittingReview: false,
        errorMessageSubmitReview: failureHandlingMessage(result.errorResponse!),
      ));
    } else {
      await loadOrderReviews(orderId);
      emit(state.copyWith(
        isSubmittingReview: false,
      ));
    }
  }


}
