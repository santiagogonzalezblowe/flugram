import 'package:flugram/app/logic/authentication/authentication_bloc.dart';
import 'package:flugram/features/home/ui/page/home_page.dart';
import 'package:flugram/features/login/ui/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationListener extends StatelessWidget {
  const AuthenticationListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          LoginPage.go(context);
        }
        if (state is Authenticated) {
          HomePage.go(context);
        }
      },
      child: child,
    );
  }
}
