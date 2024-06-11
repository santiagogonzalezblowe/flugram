import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/sign_up/logic/sign_up_bloc.dart';
import 'package:flutter/material.dart';

class SignUpListener extends StatelessWidget {
  const SignUpListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BloweBlocListener<SignUpBloc, void>(
      onCompleted: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign up successful!'),
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
      child: child,
    );
  }
}
