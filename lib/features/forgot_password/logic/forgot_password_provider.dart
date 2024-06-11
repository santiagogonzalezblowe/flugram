import 'package:flugram/app/repositories/authentication_repository.dart';
import 'package:flugram/features/forgot_password/logic/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordProvider extends StatelessWidget {
  const ForgotPasswordProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(
        context.read<AuthenticationRepository>(),
      ),
      child: child,
    );
  }
}
