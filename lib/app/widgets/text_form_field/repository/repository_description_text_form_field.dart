import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoryDescriptionTextFormField extends BloweTextFormField {
  RepositoryDescriptionTextFormField({
    super.key,
    super.controller,
    super.enabled,
    super.onEditingComplete,
    super.textInputAction,
  }) : super(
          validator: (context, value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.enterRepositoryDescription;
            }
            return null;
          },
          keyboardType: TextInputType.text,
          labelText: (context) =>
              AppLocalizations.of(context)!.repositoryDescription,
        );
}
