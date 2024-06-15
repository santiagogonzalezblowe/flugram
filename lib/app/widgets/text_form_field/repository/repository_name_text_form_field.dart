import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoryNameTextFormField extends BloweTextFormField {
  RepositoryNameTextFormField({
    super.key,
    super.controller,
    super.enabled,
    super.onEditingComplete,
    super.textInputAction,
  }) : super(
          validator: (context, value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.enterRepositoryName;
            }
            if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
              return AppLocalizations.of(context)!.onlyLettersAndNumbers;
            }
            return null;
          },
          keyboardType: TextInputType.text,
          labelText: (context) => AppLocalizations.of(context)!.repositoryName,
        );
}
