import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/login/logic/login_bloc.dart';
import 'package:flugram/features/login/logic/social_login_bloc.dart';
import 'package:flutter/material.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BloweBlocListener<LoginBloc, void>(
          onCompleted: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sign in successful!'),
              ),
            );
          },
          onError: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.toString()),
              ),
            );
          },
        ),
        BloweBlocListener<SocialLoginBloc, void>(
          onCompleted: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sign in successful!'),
              ),
            );
          },
          onError: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error.toString()),
              ),
            );
          },
        ),
      ],
      child: child,
    );
  }
}
