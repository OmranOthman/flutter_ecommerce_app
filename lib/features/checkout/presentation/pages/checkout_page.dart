import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/widget/order_confirmation_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/features/new_card/presentation/view_model/add_new_card_cubit/payment_methods_cubit.dart';
import 'package:flutter_ecommerce_app/models/location_item_model.dart';
import 'package:flutter_ecommerce_app/models/payment_card_model.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/widget/payment_method_bottom_sheet.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/widget/checkout_headlines_item.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/widget/empty_shipping_payment.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/widget/label_with_value_row.dart';
import 'package:flutter_ecommerce_app/features/checkout/presentation/widget/payment_method_item.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final cubit = CheckoutCubit();
            cubit.getCheckoutContent();
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) => PaymentMethodsCubit(),
        ),
      ],
      child: const CheckoutView(),
    );
  }
}

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  Widget _buildPaymentMethodItem(PaymentCardModel? chosenCard, BuildContext context) {
    final checkoutCubit = BlocProvider.of<CheckoutCubit>(context);

    if (chosenCard != null) {
      return PaymentMethodItem(
        paymentCard: chosenCard,
        onItemTapped: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.65,
                child: BlocProvider(
                  create: (context) {
                    final cubit = PaymentMethodsCubit();
                    cubit.fetchPaymentMethods();
                    return cubit;
                  },
                  child: const PaymentMethodBottomSheet(),
                ),
              );
            },
          ).then((value) async {
            await checkoutCubit.getCheckoutContent();
          });
        },
      );
    } else {
      return EmptyShippingAndPayment(
        title: 'add_payment_method'.tr,
        isPayment: true,
      );
    }
  }

  Widget _buildShippingItem(LocationItemModel? chosenAddress, BuildContext context) {
    if (chosenAddress != null) {
      return LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: chosenAddress.imgUrl,
                width: width * 0.4 > 140 ? 140 : width * 0.4,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: width * 0.05),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chosenAddress.city,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${chosenAddress.city}, ${chosenAddress.country}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        );
      });
    } else {
      return EmptyShippingAndPayment(
        title: 'add_shipping_address'.tr,
        isPayment: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CheckoutCubit>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'payment'.tr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: BlocBuilder<CheckoutCubit, CheckoutState>(
        bloc: cubit,
        buildWhen: (previous, current) =>
        current is CheckoutLoaded ||
            current is CheckoutLoading ||
            current is CheckoutError,
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is CheckoutError) {
            return Center(
              child: Text(
                'something_went_wrong'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          } else if (state is CheckoutLoaded) {
            final cartItems = state.cartItems;
            final chosenPaymentCard = state.chosenPaymentCard;
            final chosenAddress = state.chosenAddress;

            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  children: [
                    CheckoutHeadlinesItem(
                      title: 'address'.tr,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RoutePath.chooseLocation)
                            .then((value) async {
                          await cubit.getCheckoutContent();
                        });
                        },
                    ),
                    const SizedBox(height: 16.0),
                    _buildShippingItem(chosenAddress, context),
                    const SizedBox(height: 24.0),
                    CheckoutHeadlinesItem(
                      title: 'products'.tr,
                      numOfProducts: state.numOfProducts,
                    ),
                    const SizedBox(height: 16.0),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      separatorBuilder: (_, __) => Divider(color: AppColors.grey2),
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.grey2,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: cartItem.product.imgUrl,
                                height: 86,
                                width: 86,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.product.name,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4.0),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text.rich(
                                          TextSpan(
                                            text: '${'size'.tr}: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: AppColors.grey),
                                            children: [
                                              TextSpan(
                                                text: cartItem.size.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        '\$${cartItem.totalPrice.toStringAsFixed(2)}',
                                        style:
                                        Theme.of(context).textTheme.headlineSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),
                    CheckoutHeadlinesItem(
                      title: 'payment_methods'.tr,
                    ),
                    const SizedBox(height: 16.0),
                    _buildPaymentMethodItem(chosenPaymentCard, context),
                    const SizedBox(height: 32.0),
                    LabelWithValueRow(
                      label: 'total_amount'.tr,
                      value: '\$${state.totalAmount.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 40.0),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: CustomButton(
                        text: 'checkout_now'.tr,
                        onTap: () =>
                            OrderConfirmationBottomSheet.show(context: context),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                'something_went_wrong'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
        },
      ),
    );
  }
}