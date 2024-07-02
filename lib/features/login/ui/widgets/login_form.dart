import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/widgets/text_form_field/user/email_text_form_field.dart';
import 'package:flugram/app/widgets/text_form_field/user/password_text_form_field.dart';
import 'package:flugram/features/login/logic/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
          BloweBlocSelector<LoginBloc, void>(
            builder: (context, enabled) => EmailTextFormField(
              controller: _emailController,
              enabled: enabled,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocSelector<LoginBloc, void>(
            builder: (context, enabled) => PasswordTextFormField(
              controller: _passwordController,
              enabled: enabled,
              textInputAction: TextInputAction.done,
              onEditingComplete: () {
                if (!_formKey.currentState!.validate()) return;

                context.read<LoginBloc>().add(BloweFetch(params));
              },
            ),
          ),
          const SizedBox(height: 16),
          BloweBlocButton<LoginBloc, ElevatedButton, void>(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;

              context.read<LoginBloc>().add(BloweFetch(params));
            },
            text: AppLocalizations.of(context)!.login,
          ),
        ],
      ),
    );
  }

  LoginParams get params => LoginParams(
        _emailController.text,
        _passwordController.text,
      );
}
