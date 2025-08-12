import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/dependency_injections.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/widget/cart_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CartPage extends StatelessWidget {
  static Route<dynamic> route({required RouteSettings settings}) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => const CartPage(),
      );

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<CartCubit>()
        ..getCart()
        ..getCartTotal(),
      child: const CartView(),
    );
  }
}

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "my_cart".tr,
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state.cart!.isEmpty) {
                return SizedBox.shrink();
              }
              return IconButton(
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: AppColors.redColor,
                  size: 24.sp,
                ),
                onPressed: () {
                  ConfirmDialog.show(
                    context,
                    title: "remove".tr,
                    confirmMessage: "are_you_sure_delete_all".tr,
                    onConfirm: () => cartCubit.deleteCart(),
                  );
                },
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        bloc: cartCubit,
        listener: (context, state) {
          if (state.deleteCartErrorMessage != null) {
            showSnackBar(context, msg: state.deleteCartErrorMessage!);
          }
          if (state.deleteCartLineSuccess) {
            cartCubit.getCartTotal();
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.errorMessage != null) {
            return ErrorMessageWidget(
              onRetry: () {
                cartCubit.getCart();
                cartCubit.getCartTotal();
              },
              errorMessage: state.errorMessage!,
            );
          }
          if (state.cart == null || state.cart!.isEmpty) {
            return EmptyWidget(message: "cart_empty".tr);
          }

          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        cartCubit.getCart();
                        cartCubit.getCartTotal();
                      },
                      child: ListView.builder(
                        padding: EdgeInsets.all(16.w),
                        itemCount: state.cart!.length,
                        itemBuilder: (context, index1) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.cart![index1].cartLines!.length,
                            itemBuilder: (context, index2) => CartItemWidget(
                              decrease: () => cartCubit.decreaseQuantity(
                                  cartId: state.cart![index1].id!,
                                  cartLineId: state
                                      .cart![index1].cartLines![index2].id!),
                              increase: () => cartCubit.increaseQuantity(
                                  cartId: state.cart![index1].id!,
                                  cartLineId: state
                                      .cart![index1].cartLines![index2].id!),
                              cartItem: state.cart![index1].cartLines![index2],
                              deleteCartItem: () {
                                cartCubit.deleteCartLine(
                                    cartId: state.cart![index1].id!,
                                    cartLineId: state
                                        .cart![index1].cartLines![index2].id!);
                              },
                            ),
                            separatorBuilder: (context, index) =>
                                Divider(color: AppColors.grey2, height: 24.h),
                          );
                        },
                      ),
                    ),
                    if (state.deleteCartIsLoading || state.isChangingQty)
                      Container(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ))
                  ],
                ),
              ),
              _buildCheckoutFooter(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCheckoutFooter(BuildContext context, CartState state) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);

    if (state.isLoadingCartTotal) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state.errorMessageCartTotal != null) {
      return Center(
        child: Text(state.errorMessageCartTotal!),
      );
    }
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: Offset(0, -5.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TextFormField(
          //   decoration: InputDecoration(
          //     hintText: 'enter_promo_code'.tr,
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8.r),
          //     ),
          //     suffixIcon: IconButton(
          //       icon: Icon(Icons.arrow_forward, size: 24.sp),
          //       onPressed: () {},
          //     ),
          //     prefixIcon: Icon(Icons.percent, size: 24.sp),
          //   ),
          // ),
          SizedBox(height: 24.h),
          _buildTotalRow(
              context, 'count'.tr, "${state.cartTotal?.count ?? "00"}"),
          SizedBox(height: 8.h),
          _buildTotalRow(context, 'vendor'.tr, state.cartTotal?.vendor ?? ""),
          SizedBox(height: 24.h),
          _buildTotalRow(
            context,
            'total_amount'.tr,
            "${(state.cartTotal?.total ?? 0).toStringAsFixed(2)} ${'OMR'.tr}",
            isBold: true,
          ),
          SizedBox(height: 16.h),
          CustomButton(
            text: "checkout".tr,
            onTap: () {
              Navigator.pushNamed(context, RoutePath.addressesRoute,
                  arguments: cartCubit);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(BuildContext context, String title, String amount,
      {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: AppColors.grey,
                fontSize: 16,
              ),
        ),
        Text(
          amount,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
