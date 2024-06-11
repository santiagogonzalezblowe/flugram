import 'package:flugram/app/widgets/text_form_field/repository_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/repository_name_text_form_field.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_repository/logic/create_repository_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateRepositoryForm extends StatefulWidget {
  const CreateRepositoryForm({super.key});

  @override
  State<CreateRepositoryForm> createState() => _CreateRepositoryFormState();
}

class _CreateRepositoryFormState extends State<CreateRepositoryForm> {
  final _formKey = GlobalKey<FormState>();

  final _repositoryNameController = TextEditingController();
  final _repositoryDescriptionController = TextEditingController();

  @override
  void dispose() {
    _repositoryNameController.dispose();
    _repositoryDescriptionController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<CreateRepositoryBloc>(
            builder: (bloc, enabled) => RepositoryNameTextFormField(
              controller: _repositoryNameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<CreateRepositoryBloc>(
            builder: (context, enabled) => RepositoryDescriptionTextFormField(
              controller: _repositoryDescriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<CreateRepositoryBloc>().add(BloweFetch(params));
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<CreateRepositoryBloc, ElevatedButton>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<CreateRepositoryBloc>().add(BloweFetch(params));
            },
            text: AppLocalizations.of(context)!.send,
          ),
        ],
      ),
    );
  }

  CreateRepositoryParams get params => CreateRepositoryParams(
        _repositoryNameController.text,
        _repositoryDescriptionController.text,
      );
}
