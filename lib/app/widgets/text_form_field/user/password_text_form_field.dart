import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordTextFormField extends BloweTextFormField {
  PasswordTextFormField({
    super.key,
    super.controller,
    super.enabled,
    super.onEditingComplete,
    super.textInputAction,
  }) : super(
          validator: (context, value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.enterPassword;
            }
            if (value.length < 6) {
              return AppLocalizations.of(context)!.passwordLength;
            }
            return null;
          },
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: (context, obscureText, toggleObscureText) {
            return IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: toggleObscureText,
            );
          },
          labelText: (context) => AppLocalizations.of(context)!.password,
        );
}
