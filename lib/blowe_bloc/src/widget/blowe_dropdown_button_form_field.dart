import 'package:flutter/material.dart';

typedef BloweDropdownButtonFormFieldValidator<T> = String? Function(
  BuildContext context,
  T? value,
);

typedef BlowDropdownMenuItemBuilder<T> = DropdownMenuItem<T> Function(
  BuildContext context,
  T item,
);

typedef BloweDropdownButtonFormFieldIconBuilder = Widget? Function(
  BuildContext context,
);

typedef BloweDropdownButtonFormFieldSuffixIconBuilder = Widget? Function(
  BuildContext context,
);

typedef BloweDropdownButtonFormFieldLabelTextBuilder = String Function(
  BuildContext context,
);

abstract class BloweDropdownButtonFormField<T> extends StatelessWidget {
  const BloweDropdownButtonFormField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    required this.labelText,
    this.icon,
    this.suffixIcon,
    this.validator,
    this.enabled = true,
    this.value,
  });

  final List<T> items;
  final Function(T? value) onChanged;
  final BlowDropdownMenuItemBuilder<T> itemBuilder;
  final BloweDropdownButtonFormFieldValidator<T>? validator;
  final BloweDropdownButtonFormFieldLabelTextBuilder labelText;
  final BloweDropdownButtonFormFieldIconBuilder? icon;
  final BloweDropdownButtonFormFieldSuffixIconBuilder? suffixIcon;
  final bool enabled;
  final T? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: items.map((item) => itemBuilder(context, item)).toList(),
      onChanged: enabled ? onChanged : null,
      validator: (value) => validator?.call(context, value),
      decoration: InputDecoration(
        labelText: labelText(context),
        suffixIcon: suffixIcon?.call(context),
      ),
      icon: icon?.call(context),
      value: value,
    );
  }
}
