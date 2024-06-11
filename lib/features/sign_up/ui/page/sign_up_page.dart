import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/sign_up/logic/sign_up_listener.dart';
import 'package:flugram/features/sign_up/logic/sign_up_provider.dart';
import 'package:flugram/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static String get routePath => 'sign-up';
  static String get routeName => 'signUp';

  static void go(BuildContext context) => context.goNamed(routeName);

  @override
  Widget build(BuildContext context) {
    return SignUpProvider(
      child: SignUpListener(
        child: Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              children: [
                FormHeader(
                  title: AppLocalizations.of(context)!.signUp,
                  description: AppLocalizations.of(context)!.signUpDescription,
                  illustration: Assets.illustrationsSignUp,
                ),
                const SizedBox(height: 32),
                const SignUpForm(),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.login,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
