import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_name_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_path_text_form_field.dart';
import 'package:flugram/features/create_page/logic/create_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatePageForm extends StatefulWidget {
  const CreatePageForm({super.key});

  @override
  State<CreatePageForm> createState() => _CreatePageFormState();
}

class _CreatePageFormState extends State<CreatePageForm> {
  final _formKey = GlobalKey<FormState>();

  final _pageNameController = TextEditingController();
  final _pageDescriptionController = TextEditingController();
  final _pagePathController = TextEditingController();

  @override
  void dispose() {
    _pageNameController.dispose();
    _pageDescriptionController.dispose();
    _pagePathController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<CreatePageBloc, void>(
            builder: (context, enabled) => PageNameTextFormField(
              controller: _pageNameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<CreatePageBloc, void>(
            builder: (context, enabled) => PageDescriptionTextFormField(
              controller: _pageDescriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<CreatePageBloc, void>(
            builder: (context, enabled) => PagePathTextFormField(
              controller: _pagePathController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<CreatePageBloc>().add(BloweFetch(params));
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<CreatePageBloc, ElevatedButton, void>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<CreatePageBloc>().add(BloweFetch(params));
            },
            text: AppLocalizations.of(context)!.send,
          ),
        ],
      ),
    );
  }

  CreatePageParams get params => CreatePageParams(
        _pageNameController.text,
        _pageDescriptionController.text,
        _pagePathController.text,
      );
}
