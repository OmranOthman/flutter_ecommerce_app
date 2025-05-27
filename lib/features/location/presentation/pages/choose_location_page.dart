import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/features/location/presentation/view_model/choose_location_cubit/choose_location_cubit.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/location/presentation/widget/location_item_widget.dart';

class ChooseLocationPage extends StatelessWidget {
  const ChooseLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseLocationCubit>(
      create: (_) => ChooseLocationCubit()..fetchLocations(),
      child: const ChooseLocationView(),
    );
  }
}

class ChooseLocationView extends StatefulWidget {
  const ChooseLocationView({super.key});

  @override
  State<ChooseLocationView> createState() => _ChooseLocationViewState();
}

class _ChooseLocationViewState extends State<ChooseLocationView> {
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChooseLocationCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('address'.tr),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'choose_your_location'.tr,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'find_event_description'.tr,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.grey,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 36.h),
                TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on),
                    suffixIcon: BlocConsumer<ChooseLocationCubit, ChooseLocationState>(
                      bloc: cubit,
                      buildWhen: (previous, current) =>
                      current is AddingLocation ||
                          current is LocationAdded ||
                          current is LocationAddingFailure,
                      listenWhen: (previous, current) =>
                      current is LocationAdded ||
                          current is LocationAddingFailure ||
                          current is ConfirmAddressLoaded,
                      listener: (context, state) {
                        if (state is LocationAdded) {
                          locationController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('location_added_successfully'.tr)),
                          );
                        } else if (state is LocationAddingFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)),
                          );
                        } else if (state is ConfirmAddressLoaded) {
                          Navigator.of(context).pop();
                        }
                      },
                      builder: (context, state) {
                        if (state is AddingLocation) {
                          return Padding(
                            padding: EdgeInsets.all(12.w),
                            child: const CircularProgressIndicator.adaptive(
                              backgroundColor: AppColors.grey,
                            ),
                          );
                        }
                        return IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            if (locationController.text.isNotEmpty) {
                              cubit.addLocation(locationController.text);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('enter_your_location'.tr)),
                              );
                            }
                          },
                        );
                      },
                    ),
                    suffixIconColor: AppColors.grey,
                    prefixIconColor: AppColors.grey,
                    hintText: 'write_location_hint'.tr,
                    fillColor: AppColors.grey1,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: const BorderSide(color: AppColors.red),
                    ),
                  ),
                ),
                SizedBox(height: 36.h),
                Text(
                  'select_location'.tr,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                BlocBuilder<ChooseLocationCubit, ChooseLocationState>(
                  bloc: cubit,
                  buildWhen: (previous, current) =>
                  current is FetchLocationsFailure ||
                      current is FetchedLocations ||
                      current is FetchingLocations,
                  builder: (context, state) {
                    if (state is FetchingLocations) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    } else if (state is FetchedLocations) {
                      final locations = state.locations;
                      return ListView.builder(
                        itemCount: locations.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final location = locations[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: BlocBuilder<ChooseLocationCubit, ChooseLocationState>(
                              bloc: cubit,
                              buildWhen: (previous, current) => current is LocationChosen,
                              builder: (context, state) {
                                if (state is LocationChosen) {
                                  final chosenLocation = state.location;
                                  return LocationItemWidget(
                                    onTap: () => cubit.selectLocation(location.id),
                                    location: location,
                                    borderColor: chosenLocation.id == location.id
                                        ? Theme.of(context).primaryColor
                                        : AppColors.grey,
                                  );
                                }
                                return LocationItemWidget(
                                  onTap: () => cubit.selectLocation(location.id),
                                  location: location,
                                );
                              },
                            ),
                          );
                        },
                      );
                    } else if (state is FetchLocationsFailure) {
                      return Center(child: Text(state.errorMessage));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: 24.h),
                BlocBuilder<ChooseLocationCubit, ChooseLocationState>(
                  bloc: cubit,
                  buildWhen: (previous, current) =>
                  current is ConfirmAddressLoading ||
                      current is ConfirmAddressLoaded ||
                      current is ConfirmAddressFailure,
                  builder: (context, state) {
                    return CustomButton(
                      text: 'confirm_address'.tr,
                      onTap: () => cubit.confirmAddress(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}