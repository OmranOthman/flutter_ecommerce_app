import 'package:flutter_ecommerce_app/features/address/data/model/address_model/address_model.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

sealed class RouteParams extends Object {}

final class VerificationParams extends RouteParams {
  final String fullPhone;
  final bool forgetPasswordPage;

  VerificationParams({
    required this.fullPhone,
    this.forgetPasswordPage = false,
  });
}

final class RestPasswordParams extends RouteParams {
  final String fullPhone;
  final String token;

  RestPasswordParams({
    required this.fullPhone,
    required this.token,
  });
}

final class ReviewParams extends RouteParams {
  final int productId;
  final String productName;
  final String productImage;

  ReviewParams({
    required this.productId,
    required this.productName,
    required this.productImage,
  });
}

final class AddressParams extends RouteParams {
  final AddressCubit addressCubit;

  AddressParams({
    required this.addressCubit,
  });
}

final class CheckoutParams extends RouteParams {
  final CartCubit cartCubit;
  final AddressModel address;

  CheckoutParams({
    required this.cartCubit,
    required this.address,
  });
}
