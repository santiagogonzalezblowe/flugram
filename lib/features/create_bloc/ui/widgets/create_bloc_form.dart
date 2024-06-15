import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/widgets/text_form_field/bloc/bloc_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/bloc/bloc_name_text_form_field.dart';
import 'package:flugram/features/create_bloc/logic/create_bloc_bloc.dart';
import 'package:flugram/features/create_bloc/logic/repositories_load_bloc.dart';
import 'package:flugram/features/create_bloc/ui/widgets/repository_dropdown_button_form_field_builder.dart';
import 'package:flugram/features/home/models/repository_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateBlocForm extends StatefulWidget {
  const CreateBlocForm({
    super.key,
    required this.parentPageIds,
  });

  final List<String> parentPageIds;

  @override
  State<CreateBlocForm> createState() => _CreateBlocFormState();
}

class _CreateBlocFormState extends State<CreateBlocForm> {
  final _formKey = GlobalKey<FormState>();

  final _pageNameController = TextEditingController();
  final _pageDescriptionController = TextEditingController();
  final List<RepositoryModel> _selectedRepositories = [];

  @override
  void dispose() {
    _pageNameController.dispose();
    _pageDescriptionController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<CreateBlocBloc>(
            builder: (context, enabled) => BlocNameTextFormField(
              controller: _pageNameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<CreateBlocBloc>(
            builder: (context, enabled) => BlocDescriptionTextFormField(
              controller: _pageDescriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweMultiBlocSelector(
            blocs: [
              context.read<CreateBlocBloc>(),
              context.read<RepositoriesLoadBloc>(),
            ],
            builder: (context, enabled) =>
                RepositoryDropdownButtonFormFieldBuilder(
              enabled: enabled,
              onChanged: (value) {
                if (value == null) return;

                setState(() => _selectedRepositories.add(value));
              },
              value: _selectedRepositories.firstOrNull,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<CreateBlocBloc, ElevatedButton>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<CreateBlocBloc>().add(BloweFetch(params));
            },
            text: AppLocalizations.of(context)!.send,
          ),
        ],
      ),
    );
  }

  CreateBlocParams get params => CreateBlocParams(
        _pageNameController.text,
        _pageDescriptionController.text,
        widget.parentPageIds,
        _selectedRepositories.map((e) => e.id).toList(),
      );
}
