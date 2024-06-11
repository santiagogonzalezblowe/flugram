import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/logic/authentication/listener/authentication_listener.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/app/widgets/or_divider.dart';
import 'package:flugram/app/widgets/social_media_authentication.dart';
import 'package:flugram/features/forgot_password/ui/page/forgot_password_page.dart';
import 'package:flugram/features/login/logic/login_blocs_provider.dart';
import 'package:flugram/features/login/logic/login_listener.dart';
import 'package:flugram/features/login/ui/widgets/login_form.dart';
import 'package:flugram/features/sign_up/ui/page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String get routePath => '/login';
  static String get routeName => 'login';

  static void go(BuildContext context) => context.goNamed(routeName);

  @override
  Widget build(BuildContext context) {
    return AuthenticationListener(
      child: LoginBlocsProvider(
        child: LoginListener(
          child: Scaffold(
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                children: [
                  FormHeader(
                    title: AppLocalizations.of(context)!.login,
                    description: AppLocalizations.of(context)!.loginDescription,
                    illustration: Assets.illustrationsLogin,
                  ),
                  const SizedBox(height: 32),
                  const LoginForm(),
                  const SizedBox(height: 16),
                  const OrDivider(),
                  const SizedBox(height: 16),
                  const SocialMediaAuthentication(),
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: () => ForgotPasswordPage.go(context),
                    child: Text(
                      AppLocalizations.of(context)!.forgotPasswordQuestion,
                    ),
                  ),
                  TextButton(
                    onPressed: () => SignUpPage.go(context),
                    child: Text(
                      AppLocalizations.of(context)!.signUp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
