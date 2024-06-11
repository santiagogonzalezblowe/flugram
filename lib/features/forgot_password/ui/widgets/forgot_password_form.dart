import 'package:flugram/app/widgets/text_form_field/user/email_text_form_field.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/forgot_password/logic/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<ForgotPasswordBloc>(
            builder: (bloc, enabled) => EmailTextFormField(
              controller: _emailController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<ForgotPasswordBloc>().add(
                      BloweFetch(
                        ForgotPasswordParams(_emailController.text),
                      ),
                    );
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<ForgotPasswordBloc, ElevatedButton>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<ForgotPasswordBloc>().add(
                    BloweFetch(
                      ForgotPasswordParams(_emailController.text),
                    ),
                  );
            },
            text: AppLocalizations.of(context)!.send,
          ),
        ],
      ),
    );
  }
}
