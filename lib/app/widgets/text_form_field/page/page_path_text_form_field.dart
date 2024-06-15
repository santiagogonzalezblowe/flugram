import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PagePathTextFormField extends BloweTextFormField {
  PagePathTextFormField({
    super.key,
    super.controller,
    super.enabled,
    super.onEditingComplete,
    super.textInputAction,
  }) : super(
          validator: (context, value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.enterPagePath;
            }
            if (!RegExp(r'^[a-zA-Z\/\-:]+$').hasMatch(value)) {
              return AppLocalizations.of(context)!.onlyLettersAndDashAndSlash;
            }
            return null;
          },
          keyboardType: TextInputType.text,
          labelText: (context) => AppLocalizations.of(context)!.pagePath,
        );
}
