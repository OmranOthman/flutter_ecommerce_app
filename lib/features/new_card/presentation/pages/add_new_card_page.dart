import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/app/lang/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/features/new_card/presentation/view_model/add_new_card_cubit/payment_methods_cubit.dart';

class AddNewCardPage extends StatelessWidget {
  const AddNewCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentMethodsCubit>(
      create: (_) => PaymentMethodsCubit(),
      child: const AddNewCardView(),
    );
  }
}

class AddNewCardView extends StatefulWidget {
  const AddNewCardView({super.key});

  @override
  State<AddNewCardView> createState() => _AddNewCardViewState();
}

class _AddNewCardViewState extends State<AddNewCardView> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PaymentMethodsCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add_new_card'.tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22.sp),
        ),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  label: 'card_number'.tr,
                  controller: _cardNumberController,
                  prefixIcon: Icon(
                    Icons.credit_card,
                    color: Theme.of(context).primaryColor,
                    size: 24.sp,
                  ),
                  hintText: 'enter_card_number'.tr,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  label: 'card_holder_name'.tr,
                  controller: _cardHolderNameController,
                  prefixIcon: Icon(
                    Icons.person_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 24.sp,
                  ),
                  hintText: 'enter_holder_name'.tr,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  label: 'expired'.tr,
                  controller: _expiryDateController,
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                    size: 24.sp,
                  ),
                  hintText: 'mm_yy'.tr,
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  label: 'cvv_code'.tr,
                  controller: _cvvController,
                  prefixIcon: Icon(
                    Icons.password,
                    color: Theme.of(context).primaryColor,
                    size: 24.sp,
                  ),
                  hintText: 'enter_cvv'.tr,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: BlocConsumer<PaymentMethodsCubit, PaymentMethodsState>(
                    bloc: cubit,
                    listenWhen: (previous, current) =>
                    current is AddNewCardFailure || current is AddNewCardSuccess,
                    listener: (context, state) {
                      if (state is AddNewCardSuccess) {
                        Navigator.pop(context);
                      } else if (state is AddNewCardFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.errorMessage,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            backgroundColor: AppColors.red,
                          ),
                        );
                      }
                    },
                    buildWhen: (previous, current) =>
                    current is AddNewCardLoading ||
                        current is AddNewCardFailure ||
                        current is AddNewCardSuccess,
                    builder: (context, state) {
                      return CustomButton(
                        onTap: state is AddNewCardLoading
                            ? null
                            : () {
                          if (_formKey.currentState!.validate()) {
                            cubit.addNewCard(
                              _cardNumberController.text,
                              _cardHolderNameController.text,
                              _expiryDateController.text,
                              _cvvController.text,
                            );
                          }
                        },
                        isLoading: state is AddNewCardLoading,
                        text: 'add_card'.tr,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}