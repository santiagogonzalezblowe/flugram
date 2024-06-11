import 'package:flugram/app/widgets/text_form_field/flugram/flugram_description_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/flugram/flugram_name_text_form_field.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_flugram/logic/create_flugram_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateFlugramForm extends StatefulWidget {
  const CreateFlugramForm({super.key});

  @override
  State<CreateFlugramForm> createState() => _CreateFlugramFormState();
}

class _CreateFlugramFormState extends State<CreateFlugramForm> {
  final _formKey = GlobalKey<FormState>();

  final _appNameController = TextEditingController();
  final _appDescriptionController = TextEditingController();

  @override
  void dispose() {
    _appNameController.dispose();
    _appDescriptionController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<CreateFlugramBloc>(
            builder: (bloc, enabled) => FlugramNameTextFormField(
              controller: _appNameController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<CreateFlugramBloc>(
            builder: (context, enabled) => FlugramDescriptionTextFormField(
              controller: _appDescriptionController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<CreateFlugramBloc>().add(BloweFetch(params));
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<CreateFlugramBloc, ElevatedButton>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<CreateFlugramBloc>().add(BloweFetch(params));
            },
            text: AppLocalizations.of(context)!.send,
          ),
        ],
      ),
    );
  }

  CreateFlugramParams get params => CreateFlugramParams(
        _appNameController.text,
        _appDescriptionController.text,
      );
}
