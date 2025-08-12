import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_distances.dart';
import 'package:flutter_ecommerce_app/core/util/input_formatters/phone_input_formatter.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_drop_down.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/country_model/country_model.dart';
import 'package:flutter_ecommerce_app/features/address/data/model/state_model/state_model.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/view_model/address_cubit/address_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class AddressInfoPage extends StatelessWidget {
  static Route<dynamic> route({
    required AddressParams params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => AddressInfoPage(
          addressCubit: params.addressCubit,
        ),
      );

  final AddressCubit addressCubit;

  const AddressInfoPage({
    required this.addressCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: addressCubit,
      child: AddressDetailsView(addressCubit: addressCubit),
    );
  }
}

class AddressDetailsView extends StatelessWidget {
  final AddressCubit addressCubit;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  const AddressDetailsView({super.key, required this.addressCubit});

  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'this_field_is_required'.tr;
    }
    return null;
  }

  String? _validateDigits(String? value) {
    if (value == null || value.isEmpty) {
      return 'this_field_is_required'.tr;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'only_digits_allowed'.tr;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('address_details'.tr),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Container(
              width: 48.w,
              height: 28.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 0.5.w),
                borderRadius: BorderRadius.circular(4.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: CachedNetworkImage(
                  imageUrl: 'https://flagcdn.com/w320/om.png',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(Icons.flag, size: 20.sp, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state.addAddressErrorMessage != null) {
            showSnackBar(context, msg: state.addAddressErrorMessage!);
          }
          if (state.saveSuccess) {
            showSnackBar(
              context,
              msg: 'address_saved_successfully'.tr,
              backgroundColor: AppColors.greanColor,
            );
            addressCubit.getAddresses();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: AppDistances.mediumPadding,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state.countryIsLoading) ...[
                    CircularProgressIndicator()
                  ] else if (state.countryErrorMessage != null) ...[
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              addressCubit.getCountries();
                            },
                            icon: Icon(Icons.restart_alt_rounded)),
                        Text(
                          state.countryErrorMessage!,
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        )
                      ],
                    )
                  ] else ...[
                    CustomDropDown<CountryModel>(
                      label: 'country'.tr,
                      enabled: false,
                      value: state.selectedCountry,
                      validator: (value) {
                        if (value == null) {
                          return 'this_field_is_required'.tr;
                        }
                        return null;
                      },
                      items: state.countries
                          .map((stateModel) => DropdownMenuItem<CountryModel>(
                                value: stateModel,
                                child: Text(stateModel.name!),
                              ))
                          .toList(),
                      onChanged: addressCubit.onCountryNameSelected,
                      hint: 'select_country'.tr,
                    ),
                  ],
                  if (state.stateIsLoading) ...[
                    CircularProgressIndicator()
                  ] else if (state.stateErrorMessage != null) ...[
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              addressCubit
                                  .getStates(state.selectedCountry!.id!);
                            },
                            icon: Icon(Icons.restart_alt_rounded)),
                        Text(
                          state.stateErrorMessage!,
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        )
                      ],
                    )
                  ] else if (state.states.isEmpty) ...[
                    SizedBox.shrink()
                  ] else ...[
                    CustomDropDown<StateModel>(
                      label: 'state'.tr,
                      value: state.selectedState,
                      validator: (value) {
                        if (value == null) {
                          return 'this_field_is_required'.tr;
                        }
                        return null;
                      },
                      items: state.states
                          .map((stateModel) => DropdownMenuItem<StateModel>(
                                value: stateModel,
                                child: Text(stateModel.name!),
                              ))
                          .toList(),
                      onChanged: addressCubit.onStateSelected,
                      hint: 'select_state'.tr,
                    ),
                  ],
                  CustomTextFormField(
                    label: 'city'.tr,
                    hintText: 'city'.tr,
                    prefixIcon: const Icon(Icons.public),
                    onChanged: addressCubit.cityNameChanged,
                    validator: _validateRequired,
                  ),
                  CustomTextFormField(
                    label: 'title'.tr,
                    hintText: 'ex_house_office_company'.tr,
                    maxLines: 2,
                    prefixIcon: const Icon(Icons.streetview),
                    onChanged: addressCubit.titleOnChanged,
                    validator: _validateRequired,
                  ),
                  CustomTextFormField(
                    label: 'line_one'.tr,
                    hintText: 'line_one'.tr,
                    maxLines: 2,
                    prefixIcon: const Icon(Icons.location_city),
                    onChanged: addressCubit.lineOneOnChanged,
                    validator: _validateRequired,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          label: 'floor'.tr,
                          hintText: 'floor'.tr,
                          keyboardType: TextInputType.number,
                          prefixIcon: const Icon(Icons.house_siding),
                          onChanged: addressCubit.floorOnChanged,
                          validator: _validateDigits,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                            ArabicNumberTextInputFormatter(),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 3,
                        child: CustomTextFormField(
                          label: 'house_number'.tr,
                          hintText: 'house_number'.tr,
                          keyboardType: TextInputType.number,
                          prefixIcon: const Icon(Icons.numbers),
                          onChanged: addressCubit.houseNumberOnChanged,
                          validator: _validateDigits,
                          maxLines: 4,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            ArabicNumberTextInputFormatter(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  CustomButton(
                    text: 'save_address'.tr,
                    isLoading: state.addAddressIsLoading,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        addressCubit.addNewAddress();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
