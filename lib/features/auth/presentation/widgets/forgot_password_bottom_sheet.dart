import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter_ecommerce_app/core/widgets/custom_text_form_field.dart';

class ForgotPasswordBottomSheet extends StatelessWidget {
  final TextEditingController emailController;

  const ForgotPasswordBottomSheet({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot Password',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Enter your email or phone number',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            readOnly: true,
            label: 'Email or Phone Number',
            suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
            controller: emailController,
            prefixIcon: Icon(Icons.email_outlined),
            hintText: 'Enter your email',
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: "Send Code",
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Reset link sent to ${emailController.text}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
