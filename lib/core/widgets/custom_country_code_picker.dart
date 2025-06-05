import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';

class CustomCountryCodePicker extends StatelessWidget {
  final void Function(String)? phoneCodeOnChanged;
  final void Function(String)? countryCodeOnChanged;
  final String? initialSelection;

  const CustomCountryCodePicker({
    this.phoneCodeOnChanged,
    this.initialSelection,
    this.countryCodeOnChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: CountryCodePicker(
        dialogBackgroundColor: AppColors.alabasterColor,
        padding: EdgeInsets.zero,
        onChanged: (value) {
          phoneCodeOnChanged!(value.dialCode!);
          countryCodeOnChanged!(value.code!);
        },
        initialSelection: initialSelection,
        showFlag: true,
        showFlagDialog: true,
      ),
    );
  }
}
