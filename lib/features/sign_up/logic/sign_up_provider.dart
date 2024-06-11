import 'package:flugram/app/repositories/authentication_repository.dart';
import 'package:flugram/features/sign_up/logic/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpProvider extends StatelessWidget {
  const SignUpProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(
        context.read<AuthenticationRepository>(),
      ),
      child: child,
    );
  }
}
