import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/repository_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoryDropdownButtonFormField
    extends BloweDropdownButtonFormField<RepositoryModel> {
  RepositoryDropdownButtonFormField({
    super.key,
    required super.items,
    required super.onChanged,
    super.enabled,
    super.icon,
    super.suffixIcon,
    super.value,
  }) : super(
          labelText: (context) => AppLocalizations.of(context)!.repositories,
          itemBuilder: (context, item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.name),
            );
          },
        );
}
