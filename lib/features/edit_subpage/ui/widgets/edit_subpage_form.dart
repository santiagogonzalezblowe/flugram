import 'package:flugram/app/widgets/text_form_field/page_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page_name_text_form_field.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/edit_subpage/logic/edit_subpage_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditSubpageForm extends StatefulWidget {
  const EditSubpageForm({
    super.key,
    required this.subpage,
  });

  final PageModel subpage;

  @override
  State<EditSubpageForm> createState() => _EditSubpageFormState();
}

class _EditSubpageFormState extends State<EditSubpageForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  late PageModel subpage;

  @override
  void initState() {
    super.initState();
    subpage = widget.subpage;
    _nameController = TextEditingController(text: subpage.name);
    _descriptionController = TextEditingController(
      text: subpage.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          BloweBlocSelector<EditSubpageBloc>(
            builder: (bloc, enabled) => PageNameTextFormField(
              controller: _nameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<EditSubpageBloc>(
            builder: (bloc, enabled) => PageDescriptionTextFormField(
              controller: _descriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
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
          ),
          const SizedBox(height: 16),
          BloweBlocButton<EditSubpageBloc, ElevatedButton>(
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
            text: AppLocalizations.of(context)!.save,
          ),
        ],
      ),
    );
  }
}
