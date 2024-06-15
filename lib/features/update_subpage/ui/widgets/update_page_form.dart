import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_name_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/page/page_path_text_form_field.dart';
import 'package:flugram/features/delete_subpage/ui/page/delete_subpage_page.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_subpage/logic/update_subpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateSubpageForm extends StatefulWidget {
  const UpdateSubpageForm({
    super.key,
    required this.page,
    required this.flugramId,
    required this.parentPageIds,
  });

  final PageModel page;
  final String flugramId;
  final List<String> parentPageIds;

  @override
  State<UpdateSubpageForm> createState() => _UpdateSubpageFormState();
}

class _UpdateSubpageFormState extends State<UpdateSubpageForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _pathController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.page.name);
    _descriptionController = TextEditingController(
      text: widget.page.description,
    );
    _pathController = TextEditingController(text: widget.page.path);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<UpdateSubpageBloc>(
            builder: (context, enabled) => PageNameTextFormField(
              controller: _nameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<UpdateSubpageBloc>(
            builder: (context, enabled) => PageDescriptionTextFormField(
              controller: _descriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<UpdateSubpageBloc>(
            builder: (context, enabled) => PagePathTextFormField(
              controller: _pathController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<UpdateSubpageBloc>().add(
                      BloweFetch(updatePageParams),
                    );
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<UpdateSubpageBloc, ElevatedButton>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<UpdateSubpageBloc>().add(
                    BloweFetch(updatePageParams),
                  );
            },
            text: AppLocalizations.of(context)!.save,
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          BloweBlocButton<UpdateSubpageBloc, ElevatedButton>(
            onPressed: () => DeleteSubpagePage.go(
              context,
              widget.flugramId,
              widget.page.id,
              widget.parentPageIds,
            ),
            text: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
    );
  }

  PageModel get updatePageParams => widget.page.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
        path: _pathController.text,
      );
}
