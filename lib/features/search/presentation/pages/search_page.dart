import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/core/widgets/empty_widget.dart';
import 'package:flutter_ecommerce_app/core/widgets/error_message_widget.dart';
import 'package:flutter_ecommerce_app/dependency_Injections.dart';
import 'package:flutter_ecommerce_app/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:flutter_ecommerce_app/features/search/presentation/widget/product_grid_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  static Route<dynamic> route({
    int? params,
    RouteSettings? settings,
  }) =>
      MaterialPageRoute(
        settings: settings,
        builder: (context) => SearchPage(
          vendorId: params,
        ),
      );

  const SearchPage({super.key, this.vendorId});

  final int? vendorId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<SearchCubit>(),
      child: SearchView(vendorId: vendorId),
    );
  }
}

class SearchView extends StatelessWidget {
  final int? vendorId;

  const SearchView({super.key, this.vendorId});

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return CustomTextFormField(
              hintText: "to_search_enter_at_least_three_characters".tr,
              onChanged: searchCubit.searchOnChanged,
              onFieldSubmitted: (value) {
                if (vendorId != null) {
                  searchCubit.searchByVendor(
                    vendorId: vendorId,
                    search: value,
                  );
                } else {
                  searchCubit.search(search: value);
                }
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  if (vendorId != null) {
                    searchCubit.searchByVendor(
                      vendorId: vendorId,
                      search: state.search,
                    );
                  } else {
                    searchCubit.search(search: state.search);
                  }
                },
              ),
              style: TextStyle(fontSize: 14),
            );
          },
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: vendorId != null
          ? _buildProductResult(context)
          : _buildVendorAndProductResult(context),
    );
  }

  Widget _buildProductResult(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.errorMessage != null) {
          return ErrorMessageWidget(
            errorMessage: state.errorMessage!,
            onRetry: () => cubit.search(search: state.search),
          );
        }

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.products != null && state.products!.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: GridView.builder(
              padding: EdgeInsets.all(12.r),
              itemCount: state.products!.length,
              gridDelegate: _gridDelegate(),
              itemBuilder: (context, index) => Center(
                child: ProductSearchItem(product: state.products![index]),
              ),
            ),
          );
        } else {
          return  EmptyWidget(
            message: "no_results_found".tr,
            icon: Icons.search_off_outlined,
          );
        }
      },
    );
  }

  Widget _buildVendorAndProductResult(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.errorMessage != null) {
          return ErrorMessageWidget(
            errorMessage: state.errorMessage!,
            onRetry: () => cubit.searchByVendor(search: state.search),
          );
        }

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.searchModel != null && state.searchModel!.isNotEmpty) {
          final allVendors = state.searchModel!;
          final allProducts =
              allVendors.expand((model) => model.products ?? []).toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  child: Text("vendors".tr,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Center(
                      child: VendorSearchItem(vendor: allVendors[index]),
                    ),
                    childCount: allVendors.length,
                  ),
                  gridDelegate: _gridDelegate(),
                ),
              ),
              if (allProducts.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    child: Text("products".tr,
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
              if (allProducts.isNotEmpty)
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Center(
                        child: ProductSearchItem(product: allProducts[index]),
                      ),
                      childCount: allProducts.length,
                    ),
                    gridDelegate: _gridDelegate(),
                  ),
                ),
            ],
          );
        } else {
          return EmptyWidget(
            message: "no_results_found".tr,
            icon: Icons.search_off_outlined,
          );
        }
      },
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,
      childAspectRatio: 0.7,
    );
  }
}
