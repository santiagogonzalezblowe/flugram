import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/widgets/text_form_field/repository/repository_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/repository/repository_name_text_form_field.dart';
import 'package:flugram/features/delete_repository/ui/page/delete_repository_page.dart';
import 'package:flugram/features/home/models/repository_model.dart';
import 'package:flugram/features/update_repository/logic/update_repository_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateRepositoryForm extends StatefulWidget {
  const UpdateRepositoryForm({
    super.key,
    required this.repository,
    required this.flugramId,
  });

  final RepositoryModel repository;
  final String flugramId;

  @override
  State<UpdateRepositoryForm> createState() => _UpdateRepositoryFormState();
}

class _UpdateRepositoryFormState extends State<UpdateRepositoryForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.repository.name);
    _descriptionController = TextEditingController(
      text: widget.repository.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<UpdateRepositoryBloc, void>(
            builder: (context, enabled) => RepositoryNameTextFormField(
              controller: _nameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<UpdateRepositoryBloc, void>(
            builder: (context, enabled) => RepositoryDescriptionTextFormField(
              controller: _descriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<UpdateRepositoryBloc>().fetch(
                      updateRepositoryParams,
                    );
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<UpdateRepositoryBloc, ElevatedButton, void>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<UpdateRepositoryBloc>().fetch(
                    updateRepositoryParams,
                  );
            },
            text: AppLocalizations.of(context)!.save,
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          BloweBlocButton<UpdateRepositoryBloc, ElevatedButton, void>(
            onPressed: () => DeleteRepositoryPage.go(
              context,
              widget.flugramId,
              widget.repository.id,
            ),
            text: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
    );
  }

  RepositoryModel get updateRepositoryParams => widget.repository.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
      );
}
