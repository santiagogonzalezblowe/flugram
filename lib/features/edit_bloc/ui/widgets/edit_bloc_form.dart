import 'package:flugram/app/widgets/text_form_field/bloc_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/bloc_name_text_form_field.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/edit_bloc/logic/edit_bloc_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditBlocForm extends StatefulWidget {
  const EditBlocForm({
    super.key,
    required this.bloc,
  });

  final BlocModel bloc;

  @override
  State<EditBlocForm> createState() => _EditBlocFormState();
}

class _EditBlocFormState extends State<EditBlocForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  late BlocModel bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.bloc;
    _nameController = TextEditingController(text: bloc.name);
    _descriptionController = TextEditingController(
      text: bloc.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          BloweBlocSelector<EditBlocBloc>(
            builder: (bloc, enabled) => BlocNameTextFormField(
              controller: _nameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<EditBlocBloc>(
            builder: (bloc, enabled) => BlocDescriptionTextFormField(
              controller: _descriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                // bloc.add(Fetch(params)),
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<EditBlocBloc, ElevatedButton>(
            text: AppLocalizations.of(context)!.save,
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              // bloc.add(
              //   Fetch(
              //     LoginParams(
              //       _emailController.text,
              //       _passwordController.text,
              //     ),
              //   ),
              // );
            },
          ),
          const SizedBox(height: 16),
          // ExpansionTile(
          //   childrenPadding: const EdgeInsets.only(bottom: 16),
          //   title: const Row(
          //     children: [
          //       Icon(Icons.storage),
          //       SizedBox(width: 16),
          //       Text('Repositories'),
          //     ],
          //   ),
          //   children: bloc.repositories.map((repository) {
          //     return EditRepositoryItem(repository: repository);
          //   }).toList(),
          // ),
        ],
      ),
    );
  }
}
