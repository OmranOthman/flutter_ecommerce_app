import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/address_model/address_model.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/widget/order_confirmation_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutPage extends StatelessWidget {
  static Route<dynamic> route({
    required CheckoutParams params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => CheckoutPage(
          cartCubit: params.cartCubit,
          addressModel: params.address,
        ),
      );

  final CartCubit cartCubit;
  final AddressModel addressModel;

  const CheckoutPage({
    required this.cartCubit,
    required this.addressModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cartCubit,
      child: CheckoutView(
        cartCubit: cartCubit,
        addressModel: addressModel,
      ),
    );
  }
}

class CheckoutView extends StatefulWidget {
  final AddressModel addressModel;
  final CartCubit cartCubit;

  const CheckoutView({
    required this.cartCubit,
    required this.addressModel,
    super.key,
  });

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late String dateNow;

  String getCurrentDate() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }

  @override
  void initState() {
    super.initState();
    dateNow = getCurrentDate();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ready_to_checkout'.tr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              if (state.errorMessageCheckout != null) {
                showSnackBar(context, msg: state.errorMessageCheckout!);
              }

              if (state.checkoutSuccess) {
                widget.cartCubit.getCart();
                widget.cartCubit.getCartTotal();
                OrderConfirmationBottomSheet.show(context: context);
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'your_address'.tr,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  _buildSelectedAddress(),
                  SizedBox(height: 16.h),

                  Text(
                    '${"products".tr} (${state.cart?.fold<int>(0, (sum, cart) => sum + (cart.cartLines?.length ?? 0))})',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  ...state.cart!.map(
                    (cart) => Column(
                      children: cart.cartLines!
                          .map(
                            (cartLine) => Container(
                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (cartLine.media != null &&
                                      cartLine.media!.isNotEmpty)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: Image.network(
                                        cartLine.media!,
                                        width: 70.w,
                                        height: 70.w,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  else
                                    Container(
                                      width: 70.w,
                                      height: 70.w,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Icon(Icons.image_not_supported),
                                    ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartLine.name ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          '${"quantity".tr}: ${cartLine.quantity ?? 1}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          '${"price".tr}: ${cartLine.price ?? 0} ${"currency".tr}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        if (cartLine.priceBeforeDiscount !=
                                            null)
                                          Padding(
                                            padding: EdgeInsets.only(top: 4.h),
                                            child: Text(
                                              '${"old_price".tr}: ${cartLine.priceBeforeDiscount} ${"currency".tr}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.grey,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    'select_payment'.tr,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: _buildPaymentMethodCard(
                          context,
                          icon: Icons.attach_money_outlined,
                          title: "cash".tr,
                          isSelected: state.paymentMethod == PaymentMethod.cash,
                          onTap: () => widget.cartCubit
                              .paymentMethodOnChanged(PaymentMethod.cash),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildPaymentMethodCard(
                          context,
                          icon: Icons.wallet,
                          title: "wallet".tr,
                          isSelected:
                              state.paymentMethod == PaymentMethod.wallet,
                          onTap: () => widget.cartCubit
                              .paymentMethodOnChanged(PaymentMethod.wallet),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100.h), // Space above the fixed footer
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
              // تم إزالة boxShadow هنا
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "total_amount".tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      '${state.cartTotal?.total ?? "-"} ${"currency".tr}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightModePrimaryColor,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomButton(
                  isLoading: state.isLoadingCheckout,
                  text: 'checkout_now'.tr,
                  onTap: () {
                    widget.cartCubit.checkout(
                      addressId: widget.addressModel.id!,
                      schedule: dateNow,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSelectedAddress() {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Image.asset(
              AppAssets.images.address,
              width: 80.w,
              height: 80.h,
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.addressModel.title ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                ),
                SizedBox(height: 6.h),
                Text(
                  '${widget.addressModel.lineOne ?? ""}, ${widget.addressModel.city ?? ""}',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '${"floor".tr}: ${widget.addressModel.floor ?? ""}, ${"house".tr}: ${widget.addressModel.houseNumber ?? ""}',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.lightModePrimaryColor.withOpacity(0.1)
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? AppColors.lightModePrimaryColor
                : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.lightModePrimaryColor.withOpacity(0.2)
                    : Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24.w,
                color: isSelected
                    ? AppColors.lightModePrimaryColor
                    : Colors.grey.shade700,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.lightModePrimaryColor
                          : Theme.of(context).textTheme.bodyLarge?.color,
                    ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.lightModePrimaryColor,
                size: 24.w,
              ),
          ],
        ),
      ),
    );
  }
}
