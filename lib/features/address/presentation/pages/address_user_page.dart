import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/app/routers/route_params.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/util/show_snack_bar.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:flutter_ecommerce_app/features/address/presentation/view_model/address_cubit/address_state.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressUserPage extends StatelessWidget {
  final AddressCubit addressCubit;

  const AddressUserPage({required this.addressCubit, super.key});

  static Route<dynamic> route({
    required AddressParams params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => AddressUserPage(
          addressCubit: params.addressCubit,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: addressCubit,
      child: AddressUserView(addressCubit: addressCubit),
    );
  }
}

class AddressUserView extends StatelessWidget {
  final AddressCubit addressCubit;

  const AddressUserView({required this.addressCubit, super.key});

  // void _showLocationServiceDisabledAlert() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('location_service_disabled'.tr),
  //       content: Text('please_enable_location_service_to_use_this_feature'.tr),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('cancel'.tr),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //             Geolocator.openLocationSettings();
  //           },
  //           child: Text('open_settings'.tr),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _selectLocation(latlong2.LatLng position) {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state.permissionErrorMessage != null) {
            showSnackBar(context, msg: state.permissionErrorMessage!);
          }
        },
        builder: (context, state) {
          if (state.mapIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Stack(
            children: [
              Positioned.fill(
                child: FlutterMap(
                  mapController: state.mapController,
                  options: MapOptions(
                    initialCenter: state.latLng!,
                    initialZoom: 15.0,
                    onTap: (tapPosition, point) {
                      addressCubit.selectLocation(point);
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.flutter_ecommerce_app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 60.w,
                          height: 80.h,
                          point: state.latLng!,
                          child:
                              const Icon(Icons.my_location, color: Colors.blue),
                        ),
                        // if (state.newAddress!.location != null)
                        //   Marker(
                        //     width: 40.w,
                        //     height: 40.h,
                        //     point: LatLng(latitude, longitude),
                        //     child: const Icon(Icons.location_on,
                        //         color: Colors.green),
                        //   ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    "select_address".tr,
                    style: textTheme.headlineMedium?.copyWith(
                      fontSize: 22,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        size: 20.sp, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.35,
                minChildSize: 0.35,
                maxChildSize: 0.38,
                builder: (context, scrollController) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.r)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, -4),
                        ),
                      ],
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Center(
                          child: Container(
                            width: 40.w,
                            height: 4.h,
                            margin: EdgeInsets.only(bottom: 12.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).dividerColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('address'.tr, style: textTheme.titleLarge),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blue,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.2),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                iconSize: 24,
                                padding: EdgeInsets.all(8),
                                color: Colors.white,
                                onPressed: () async {
                                  addressCubit.animateToLocation();
                                },
                                icon: Icon(Icons.my_location),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        // if (_address.isNotEmpty) ...[
                        //   Padding(
                        //     padding: EdgeInsets.symmetric(vertical: 12.h),
                        //     child: Text(
                        //       _address,
                        //       style: textTheme.bodyLarge,
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // ],
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          text: "confirm_address".tr,
                          isLoading: false,
                          onTap: () {
                            // if (_selectedLocation == null) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       content: Text(
                            //           'please_select_a_location_on_the_map'.tr),
                            //     ),
                            //   );
                            //   return;
                            // }

                            Navigator.pushNamed(
                                context, RoutePath.addressInfoRoute,
                                arguments:
                                    AddressParams(addressCubit: addressCubit));
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).viewInsets.bottom),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
