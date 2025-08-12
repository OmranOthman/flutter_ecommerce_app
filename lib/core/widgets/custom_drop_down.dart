import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  final String? Function(T?)? validator;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final String hint;
  final bool enabled;
  final String label;
  const CustomDropDown({
    this.validator,
    this.value,
    required this.items,
    required this.onChanged,
    required this.hint,
    this.enabled = true,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        DropdownButtonFormField<T>(
          isExpanded: true,
          decoration: InputDecoration(
            enabled: enabled,
            prefixIcon: Icon(Icons.location_city),
          ),
          value: value,
          validator: validator,
          items: items,
          onChanged: enabled ? onChanged : null,
          icon: Icon(Icons.arrow_drop_down),
          hint: Text(hint),
        ),
      ],
    );
  }
}
