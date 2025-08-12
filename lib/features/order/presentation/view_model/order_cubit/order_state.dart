part of 'order_cubit.dart';

class OrderState extends Equatable {
  final bool isLoadingOrderDetails;
  final bool isLoadingPay;
  final bool paySuccess;
  final String? errorMessagePay;
  final String? errorMessageOrderDetails;
  final bool isLoadingOnGoingOrders;
  final String? errorMessageOnGoingOrders;
  final bool isLoadingCompletedOrders;
  final String? errorMessageCompletedOrders;
  final List<OrderModel>? onGoingOrders;
  final List<OrderModel>? completedOrders;
  final OrderModel? orderModel;
 
  final bool isLoadingOrderReviews;
  final String? errorMessageOrderReviews;
  final List<OrderReviewModel>? orderReviews;
  final bool isSubmittingReview;
  final String? errorMessageSubmitReview;

  OrderState({
    List<OrderModel>? completedOrders,
    List<OrderModel>? onGoingOrders,
    this.isLoadingOrderDetails = false,
    this.errorMessageOrderDetails,
    this.isLoadingCompletedOrders = false,
    this.isLoadingOnGoingOrders = false,
    this.errorMessageCompletedOrders,
    this.errorMessageOnGoingOrders,
   
    this.isLoadingPay = false,
    this.paySuccess = false,
    this.errorMessagePay,
    this.orderModel,
    this.orderReviews,
    this.isLoadingOrderReviews = false,
    this.errorMessageOrderReviews,
    this.isSubmittingReview = false,
    this.errorMessageSubmitReview,
  })  : onGoingOrders = onGoingOrders ?? [],
        completedOrders = completedOrders ?? [];

  factory OrderState.init() => OrderState(
    onGoingOrders: [],
    completedOrders: [],
    orderReviews: [],
    isLoadingCompletedOrders: false,
    isLoadingOnGoingOrders: false,
    isLoadingOrderDetails: false,
    isLoadingPay: false,
    isLoadingOrderReviews: false,
    isSubmittingReview: false,
    paySuccess: false,

  );


  OrderState copyWith({
    bool? isLoadingOrderDetails,
    String? errorMessageOrderDetails,
    bool? isLoadingCompletedOrders,
    String? errorMessageCompletedOrders,
    bool? isLoadingOnGoingOrders,
    String? errorMessageOnGoingOrders,
    List<OrderModel>? onGoingOrders,
    List<OrderModel>? completedOrders,
    OrderModel? orderModel,
    bool? isLoadingPay,
    String? errorMessagePay,
    bool? paySuccess,
  
    List<OrderReviewModel>? orderReviews,
    bool? isLoadingOrderReviews,
    String? errorMessageOrderReviews,
    bool? isSubmittingReview,
    String? errorMessageSubmitReview,
  }) {
    return OrderState(
      isLoadingCompletedOrders:
          isLoadingCompletedOrders ?? this.isLoadingCompletedOrders,
      isLoadingOnGoingOrders:
          isLoadingOnGoingOrders ?? this.isLoadingOnGoingOrders,
      errorMessageOnGoingOrders: errorMessageOnGoingOrders,
      errorMessageCompletedOrders: errorMessageCompletedOrders,
      completedOrders: completedOrders ?? this.completedOrders,
      onGoingOrders: onGoingOrders ?? this.onGoingOrders,
      errorMessageOrderDetails: errorMessageOrderDetails,
      orderModel: orderModel ?? this.orderModel,
      isLoadingOrderDetails:
          isLoadingOrderDetails ?? this.isLoadingOrderDetails,
      isLoadingPay: isLoadingPay ?? this.isLoadingPay,
      errorMessagePay: errorMessagePay,
      paySuccess: paySuccess ?? this.paySuccess,
     
      orderReviews: orderReviews ?? this.orderReviews,
      isLoadingOrderReviews:
          isLoadingOrderReviews ?? this.isLoadingOrderReviews,
      errorMessageOrderReviews: errorMessageOrderReviews,
      isSubmittingReview: isSubmittingReview ?? this.isSubmittingReview,
      errorMessageSubmitReview: errorMessageSubmitReview,
    );
  }

  @override
  List<Object?> get props => [
        errorMessageCompletedOrders,
        errorMessageCompletedOrders,
        isLoadingCompletedOrders,
        isLoadingOnGoingOrders,
        errorMessagePay,
        isLoadingPay,
        orderModel,
        onGoingOrders,
        completedOrders,
        isLoadingOrderDetails,
        errorMessageOrderDetails,
        paySuccess,
        orderReviews,
        isLoadingOrderReviews,
        errorMessageOrderReviews,
        isSubmittingReview,
        errorMessageSubmitReview,
      ];
}

