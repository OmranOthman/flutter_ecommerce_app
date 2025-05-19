import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class LabelWithTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool obsecureText;
  final bool? readOnly;
  final FocusNode? focusNode;

  const LabelWithTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.obsecureText = false,
    this.readOnly,
    this.focusNode,
  });

  @override
  State<LabelWithTextField> createState() => _LabelWithTextFieldState();
}

class _LabelWithTextFieldState extends State<LabelWithTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  Color _prefixIconColor = AppColors.grey;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
    widget.controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    widget.controller.removeListener(_handleTextChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _handleTextChange() {
    setState(() {
      _prefixIconColor = widget.controller.text.isNotEmpty
          ? Theme.of(context).primaryColorDark
          : AppColors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          textInputAction: TextInputAction.next,
          focusNode: _focusNode,
          readOnly: widget.readOnly ?? false,
          controller: widget.controller,
          validator: (value) => value == null || value.isEmpty
              ? '${widget.label} cannot be empty!'
              : null,
          obscureText: widget.obsecureText,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.prefixIcon,
              color: _prefixIconColor,
            ),
            suffixIcon: widget.suffixIcon,
            suffixIconColor: AppColors.grey,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black26, fontSize: 15),
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}