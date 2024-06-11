import 'package:flugram/app/repositories/authentication_repository.dart';
import 'package:flugram/features/login/logic/login_bloc.dart';
import 'package:flugram/features/login/logic/social_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocsProvider extends StatelessWidget {
  const LoginBlocsProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            context.read<AuthenticationRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => SocialLoginBloc(
            context.read<AuthenticationRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
