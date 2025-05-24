import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ecommerce_app/app/routers/route_info.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/features/new_card/presentation/view_model/add_new_card_cubit/payment_methods_cubit.dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentMethodsCubit = BlocProvider.of<PaymentMethodsCubit>(context);

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 36.h,
            bottom: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Methods',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 16.h),
              BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
                bloc: paymentMethodsCubit,
                buildWhen: (previous, current) =>
                current is FetchedPaymentMethods ||
                    current is FetchPaymentMethodsError ||
                    current is FetchingPaymentMethods,
                builder: (_, state) {
                  if (state is FetchingPaymentMethods) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is FetchedPaymentMethods) {
                    final paymentCards = state.paymentCards;
                    if (paymentCards.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Text(
                          'No payment methods found. Please add a new card.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: paymentCards.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final paymentCard = paymentCards[index];
                        return Card(
                          elevation: 0,
                          margin: EdgeInsets.symmetric(vertical: 6.h),
                          child: ListTile(
                            onTap: () {
                              paymentMethodsCubit
                                  .changePaymentMethod(paymentCard.id);
                            },
                            leading: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.grey2,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 8.h),
                                child: CachedNetworkImage(
                                  imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/MasterCard_Logo.svg/1200px-MasterCard_Logo.svg.png',
                                  width: 50.w,
                                  height: 50.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            title: Text(paymentCard.cardNumber),
                            subtitle: Text(paymentCard.cardHolderName),
                            trailing: BlocBuilder<PaymentMethodsCubit,
                                PaymentMethodsState>(
                              bloc: paymentMethodsCubit,
                              buildWhen: (previous, current) =>
                              current is PaymentMethodChosen,
                              builder: (context, state) {
                                if (state is PaymentMethodChosen) {
                                  final chosenPayment =
                                      state.chosenPayment;
                                  return Radio<String>(
                                    value: paymentCard.id,
                                    groupValue: chosenPayment.id,
                                    onChanged: (id) {
                                      paymentMethodsCubit
                                          .changePaymentMethod(id!);
                                    },
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is FetchPaymentMethodsError) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 8.h),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(RoutePath.addNewCardRoute,
                      arguments: paymentMethodsCubit)
                      .then((value) async =>
                  await paymentMethodsCubit.fetchPaymentMethods());
                },
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.symmetric(vertical: 6.h),
                  child: ListTile(
                    leading: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.grey2,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: const Icon(Icons.add),
                      ),
                    ),
                    title: const Text('Add New Card'),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              BlocConsumer<PaymentMethodsCubit, PaymentMethodsState>(
                bloc: paymentMethodsCubit,
                listenWhen: (previous, current) =>
                current is ConfirmPaymentSuccess,
                buildWhen: (previous, current) =>
                current is ConfirmPaymentLoading ||
                    current is ConfirmPaymentSuccess ||
                    current is ConfirmPaymentFailure,
                listener: (context, state) {
                  if (state is ConfirmPaymentSuccess) {
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  final isLoading = state is ConfirmPaymentLoading;
                  return CustomButton(
                    text: 'Confirm Payment',
                    isLoading: isLoading,
                    onTap: isLoading
                        ? null
                        : () {
                      paymentMethodsCubit.confirmPaymentMethod();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
