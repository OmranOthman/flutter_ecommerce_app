import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/core/constans/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constans/app_distances.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final String? initialValue;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? label;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final int? minLines;
  final int? maxLines;
  final TextInputAction? textInputActio;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final TextDirection? hintTextDirection;
  final EdgeInsetsGeometry? contentPadding;
  final AutovalidateMode? autovalidateMode;
  final bool readOnly;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final bool autofocus;
  final bool? enabled;
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    this.obscureText = false,
    this.keyboardType,
    this.label,
    this.labelStyle,
    this.minLines = 1,
    this.maxLines = 1,
    this.validator,
    this.textInputActio,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onSaved,
    this.onChanged,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 15),
    this.autovalidateMode,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.autofocus = false,
    this.enabled,
    this.hintTextDirection,
    this.style,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...label == null
            ? []
            : [
              Text(label.toString(), style: labelStyle),
              const SizedBox(height: AppDistances.smallPadding),
            ],
        TextFormField(
          textDirection: textDirection,
          enabled: enabled,
          onSaved: onSaved,
          autofocus: autofocus,
          readOnly: readOnly,
          controller: controller,
          autovalidateMode: autovalidateMode,
          focusNode: focusNode,
          textInputAction: textInputActio,
          onFieldSubmitted: onFieldSubmitted,
          onEditingComplete: onEditingComplete,
          onTapOutside: (event) => focusNode?.unfocus(),
          style:
              style ??
              const TextStyle(
                height: 1,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          obscureText: obscureText,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines,
          cursorColor: AppColors.martiniqueColor,
          textAlign: textAlign,
          decoration: InputDecoration(
            fillColor: enabled == false ? AppColors.altoColor : null,
          
            hintTextDirection: hintTextDirection,
            prefixIcon: prefixIcon,
            prefixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
            hintText: hintText,
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 30,
              minHeight: 30,
              maxWidth: 75,
              minWidth: 75,
            ),
          ),
          validator: validator,
          onTap: onTap,
        ),
      ],
    );
  }
}
