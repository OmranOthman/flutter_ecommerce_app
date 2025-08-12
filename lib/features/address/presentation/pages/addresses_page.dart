import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/constants/app_assets.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/address_model/address_model.dart';
import 'package:flutter_ecommerce_app/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/dependency_Injections.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/view_model/address_cubit/address_state.dart';

class AddressesPage extends StatelessWidget {
  final CartCubit? cartCubit;

  static Route<dynamic> route({
    CartCubit? params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => AddressesPage(
          cartCubit: params,
        ),
      );

  const AddressesPage({this.cartCubit, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AddressCubit>()
        ..getAddresses()
        ..handleLocationPermission()
        ..getCountries(),
      child: AddressView(
        cartCubit: cartCubit,
      ),
    );
  }
}

class AddressView extends StatelessWidget {
  final CartCubit? cartCubit;

  const AddressView({this.cartCubit, super.key});

  @override
  Widget build(BuildContext context) {
    AddressCubit addressCubit = BlocProvider.of<AddressCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('address'.tr),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'choose_your_location'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_location_alt_outlined,
                                    color: AppColors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RoutePath.addressUserRoute,
                                        arguments: AddressParams(
                                            addressCubit: addressCubit));
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'find_event_description'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: AppColors.grey,
                                  fontSize: 16,
                                ),
                          ),
                          SizedBox(height: 16.h),
                          BlocConsumer<AddressCubit, AddressState>(
                            listener: (context, state) {
                              if (state.deleteAddressErrorMessage != null) {
                                showSnackBar(context,
                                    msg: state.deleteAddressErrorMessage!);
                              }
                            },
                            builder: (context, state) {
                              if (state.isLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (state.errorMessage != null) {
                                return ErrorMessageWidget(
                                  errorMessage: state.errorMessage!,
                                  onRetry: () {
                                    addressCubit.getAddresses();
                                  },
                                );
                              }

                              if (state.addresses.isEmpty) {
                                return EmptyWidget(
                                  message: 'no_addresses_found'.tr,
                                );
                              }

                              return ListView.builder(
                                itemCount: state.addresses.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  AddressModel address = state.addresses[index];
                                  bool isSelected =
                                      address == state.selectedAddress;

                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: InkWell(
                                        onTap: () {
                                          if (cartCubit != null) {
                                            addressCubit.selectAddress(address);
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(16.w),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.15)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            border: Border.all(
                                              color: isSelected
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : AppColors.grey,
                                              width: isSelected ? 2.5 : 1,
                                            ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 12.w),
                                                child: ClipOval(
                                                  child: Image.asset(
                                                    AppAssets.images.map,
                                                    width: 90.w,
                                                    height: 90.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            address.title ?? '',
                                                            style:
                                                                Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium
                                                                    ?.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          20,
                                                                      color: isSelected
                                                                          ? Theme.of(context)
                                                                              .primaryColor
                                                                          : Colors
                                                                              .black87,
                                                                    ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.r),
                                                          onTap: () {
                                                            ConfirmDialog.show(
                                                              context,
                                                              title:
                                                                  'confirm_delete_title'
                                                                      .tr,
                                                              confirmMessage:
                                                                  'confirm_delete_message'
                                                                      .tr,
                                                              onConfirm: () {
                                                                addressCubit
                                                                    .deleteAddress(
                                                                        address
                                                                            .id!);
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 36.w,
                                                            height: 36.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .redColor
                                                                  .withValues(
                                                                      alpha:
                                                                          0.1),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              size: 20.w,
                                                              color: AppColors
                                                                  .redColor,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 6.h),
                                                    Text(
                                                      '${address.lineOne ?? ""}, ${address.city ?? ""}',
                                                      style: TextStyle(
                                                        color: AppColors.grey,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.h),
                                                    Text(
                                                      '${'floor'.tr}: ${address.floor ?? ""}, ${'house'.tr}: ${address.houseNumber ?? ""}',
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
                                        )),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (cartCubit != null)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomButton(
                      text: 'confirm_address'.tr,
                      onTap: () {
                        if (addressCubit.state.selectedAddress != null) {
                          Navigator.of(context).pushNamed(
                              RoutePath.checkoutRoute,
                              arguments: CheckoutParams(
                                  cartCubit: cartCubit!,
                                  address:
                                      addressCubit.state.selectedAddress!));
                        } else {
                          showSnackBar(context,
                              msg: "please_select_your_address".tr);
                        }
                      },
                    ),
                  ),
              ],
            ),
            BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                if (state.deleteAddressIsLoading) {
                  return Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: AppColors.primary.withValues(alpha: 0.1),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ));
                }
                return SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
