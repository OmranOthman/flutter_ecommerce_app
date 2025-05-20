import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce_app/features/new_cart/presentation/view_model/add_new_card_cubit/payment_methods_cubit.dart';

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
          'Add New Card',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  label: 'Card Number',
                  controller: _cardNumberController,
                  prefixIcon: Icon(
                    Icons.credit_card,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: 'Enter card number',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Card Holder Name',
                  controller: _cardHolderNameController,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: 'Enter card holder name',
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'Expiry Date',
                  controller: _expiryDateController,
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: 'MM/YY',
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  label: 'CVV',
                  controller: _cvvController,
                  prefixIcon: Icon(
                    Icons.password,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: '123',
                  obscureText: true,
                  keyboardType: TextInputType.number,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
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
                        text: 'Add Card',
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