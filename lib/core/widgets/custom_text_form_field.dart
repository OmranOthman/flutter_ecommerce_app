import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter_ecommerce_app/core/constants/app_distances.dart';

class CustomTextFormField extends StatefulWidget {
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
  final bool? filled;

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
    this.filled = true,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  bool get _hasFocus => _focusNode.hasFocus;
  bool get _hasText => _controller.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();

    _focusNode.addListener(_updateState);
    _controller.addListener(_updateState);
  }

  void _updateState() => setState(() {});

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isActive = _hasFocus || _hasText;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: AppDistances.smallPadding),
        ],
        TextFormField(
          textDirection: widget.textDirection,
          enabled: widget.enabled,
          onSaved: widget.onSaved,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          controller: _controller,
          autovalidateMode: widget.autovalidateMode,
          focusNode: _focusNode,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: widget.onFieldSubmitted,
          onEditingComplete: widget.onEditingComplete,
          onTapOutside: (event) => _focusNode.unfocus(),
          style: widget.style ?? Theme.of(context).textTheme.bodyLarge,
          onChanged: widget.onChanged,
          inputFormatters: widget.inputFormatters,
          initialValue: widget.initialValue,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          cursorColor: AppColors.martiniqueColor,
          textAlign: widget.textAlign,
          onTap: widget.onTap,
          decoration: InputDecoration(
            filled: widget.filled,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: AppDistances.mediumPadding),
            hintTextDirection: widget.hintTextDirection,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.grey,
            ),
            suffixIcon: widget.suffixIcon != null
                ? IconTheme(
              data: IconThemeData(
                color: AppColors.grey.withOpacity(0.5),
              ),
              child: widget.suffixIcon!,
            )
                : null,
            prefixIcon: widget.prefixIcon != null
                ? IconTheme(
              data: IconThemeData(
                color: isActive
                    ? Theme.of(context).primaryColor
                    : AppColors.grey,
              ),
              child: widget.prefixIcon!,
            )
                : null,

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
               color:  Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(16),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
