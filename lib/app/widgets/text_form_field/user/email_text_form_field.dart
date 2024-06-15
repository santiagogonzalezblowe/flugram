import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailTextFormField extends BloweTextFormField {
  EmailTextFormField({
    super.key,
    super.controller,
    super.enabled,
    super.onEditingComplete,
    super.textInputAction,
  }) : super(
          validator: (context, value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.enterEmail;
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return AppLocalizations.of(context)!.enterValidEmail;
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          labelText: (context) => AppLocalizations.of(context)!.email,
        );
}
