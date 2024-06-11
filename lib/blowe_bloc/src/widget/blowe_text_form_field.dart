import 'package:flutter/material.dart';

typedef BloweFormFieldValidator<T> = String? Function(
  BuildContext context,
  T value,
);

typedef BloweFormFieldSuffixIconBuilder = Widget Function(
  BuildContext context,
  bool obscureText,
  VoidCallback toggleObscureText,
);
typedef BloweFormFieldLabelTextBuilder = String Function(
  BuildContext context,
);

abstract class BloweTextFormField extends StatefulWidget {
  const BloweTextFormField({
    super.key,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.enabled,
    this.onEditingComplete,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    required this.labelText,
  });

  final bool obscureText;
  final TextEditingController? controller;
  final bool? enabled;
  final VoidCallback? onEditingComplete;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final BloweFormFieldValidator<String?>? validator;
  final BloweFormFieldSuffixIconBuilder? suffixIcon;
  final BloweFormFieldLabelTextBuilder labelText;

  @override
  State<BloweTextFormField> createState() => _BloweTextFormFieldState();
}

class _BloweTextFormFieldState extends State<BloweTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText(context),
        suffixIcon: widget.suffixIcon?.call(
          context,
          _obscureText,
          toggleObscureText,
        ),
      ),
      obscureText: _obscureText,
      validator: (value) => widget.validator?.call(context, value),
      enabled: widget.enabled,
      onEditingComplete: widget.onEditingComplete,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
    );
  }

  void toggleObscureText() {
    setState(() => _obscureText = !_obscureText);
  }
}
