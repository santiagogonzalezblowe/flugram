import 'package:flugram/app/widgets/text_form_field/page_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page_name_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page_path_text_form_field.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_subpage/logic/create_subpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateSubpageForm extends StatefulWidget {
  const CreateSubpageForm({
    super.key,
    required this.parentPageIds,
  });

  final List<String> parentPageIds;

  @override
  State<CreateSubpageForm> createState() => _CreateSubpageFormState();
}

class _CreateSubpageFormState extends State<CreateSubpageForm> {
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
          BloweBlocSelector<CreateSubpageBloc>(
            builder: (bloc, enabled) => PageNameTextFormField(
              controller: _pageNameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<CreateSubpageBloc>(
            builder: (context, enabled) => PageDescriptionTextFormField(
              controller: _pageDescriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<CreateSubpageBloc>(
            builder: (context, enabled) => PagePathTextFormField(
              controller: _pagePathController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<CreateSubpageBloc>().add(BloweFetch(params));
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<CreateSubpageBloc, ElevatedButton>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<CreateSubpageBloc>().add(BloweFetch(params));
            },
            text: AppLocalizations.of(context)!.send,
          ),
        ],
      ),
    );
  }

  CreateSubpageParams get params => CreateSubpageParams(
        _pageNameController.text,
        _pageDescriptionController.text,
        _pagePathController.text,
        widget.parentPageIds,
      );
}
