import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_name_text_form_field.dart';
import 'package:flugram/features/create_bloc/ui/widgets/repository_dropdown_button_form_field_builder.dart';
import 'package:flugram/features/delete_bloc/ui/page/delete_bloc_page.dart';
import 'package:flugram/features/home/models/bloc_model.dart';
import 'package:flugram/features/home/models/repository_model.dart';
import 'package:flugram/features/update_bloc/logic/update_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateBlocForm extends StatefulWidget {
  const UpdateBlocForm({
    super.key,
    required this.bloc,
    required this.flugramId,
    required this.parentPageIds,
    required this.repositories,
  });

  final BlocModel bloc;
  final String flugramId;
  final List<String> parentPageIds;
  final List<RepositoryModel> repositories;

  @override
  State<UpdateBlocForm> createState() => _UpdateBlocFormState();
}

class _UpdateBlocFormState extends State<UpdateBlocForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  late List<RepositoryModel> _selectedRepositories;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.bloc.name);
    _descriptionController = TextEditingController(
      text: widget.bloc.description,
    );
    _selectedRepositories = widget.repositories;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<UpdateBlocBloc, void>(
            builder: (context, enabled) => PageNameTextFormField(
              controller: _nameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<UpdateBlocBloc, void>(
            builder: (context, enabled) => PageDescriptionTextFormField(
              controller: _descriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<UpdateBlocBloc, void>(
            builder: (context, enabled) =>
                RepositoryDropdownButtonFormFieldBuilder(
              enabled: enabled,
              value: _selectedRepositories.firstOrNull,
              onChanged: (value) {
                if (value == null) return;

                setState(() => _selectedRepositories.add(value));
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<UpdateBlocBloc, ElevatedButton, void>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<UpdateBlocBloc>().fetch(updateBlocParams);
            },
            text: AppLocalizations.of(context)!.save,
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          BloweBlocButton<UpdateBlocBloc, ElevatedButton, void>(
            onPressed: () => DeleteBlocPage.go(
              context,
              widget.flugramId,
              widget.bloc.id,
              widget.parentPageIds,
            ),
            text: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
    );
  }

  BlocModel get updateBlocParams => widget.bloc.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        repositoryIds: _selectedRepositories.map((e) => e.id).toList(),
      );
}
