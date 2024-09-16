import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/widgets/text_form_field/flugram/flugram_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/flugram/flugram_name_text_form_field.dart';
import 'package:flugram/features/delete_flugram/ui/page/delete_flugram_page.dart';
import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flugram/features/update_flugram/logic/update_flugram_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateFlugramForm extends StatefulWidget {
  const UpdateFlugramForm({
    super.key,
    required this.flugram,
  });

  final FlugramModel flugram;

  @override
  State<UpdateFlugramForm> createState() => _UpdateFlugramFormState();
}

class _UpdateFlugramFormState extends State<UpdateFlugramForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.flugram.name);
    _descriptionController = TextEditingController(
      text: widget.flugram.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          BloweBlocSelector<UpdateFlugramBloc, void>(
            builder: (context, enabled) => FlugramNameTextFormField(
              controller: _nameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<UpdateFlugramBloc, void>(
            builder: (context, enabled) => FlugramDescriptionTextFormField(
              controller: _descriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<UpdateFlugramBloc>().fetch(params);
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<UpdateFlugramBloc, ElevatedButton, void>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<UpdateFlugramBloc>().fetch(params);
            },
            text: AppLocalizations.of(context)!.save,
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          BloweBlocButton<UpdateFlugramBloc, ElevatedButton, void>(
            onPressed: () => DeleteFlugramPage.go(context, widget.flugram.id),
            text: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
    );
  }

  FlugramModel get params => widget.flugram.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
      );
}
