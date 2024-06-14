import 'package:flugram/app/widgets/text_form_field/user/email_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/user/password_text_form_field.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/sign_up/logic/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BloweBlocSelector<SignUpBloc>(
            builder: (context, enabled) => EmailTextFormField(
              controller: _emailController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<SignUpBloc>(
            builder: (context, enabled) => PasswordTextFormField(
              controller: _passwordController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<SignUpBloc>().add(BloweFetch(params));
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<SignUpBloc, ElevatedButton>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<SignUpBloc>().add(BloweFetch(params));
            },
            text: AppLocalizations.of(context)!.signUp,
          ),
        ],
      ),
    );
  }

  SignUpParams get params => SignUpParams(
        _emailController.text,
        _passwordController.text,
      );
}
