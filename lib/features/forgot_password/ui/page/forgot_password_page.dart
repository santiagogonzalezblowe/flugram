import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/forgot_password/logic/forgot_password_listener.dart';
import 'package:flugram/features/forgot_password/logic/forgot_password_provider.dart';
import 'package:flugram/features/forgot_password/ui/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static String get routePath => 'forgot-password';
  static String get routeName => 'forgotPassword';

  static void go(BuildContext context) => context.goNamed(routeName);

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordProvider(
      child: ForgotPasswordListener(
        child: Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              children: [
                FormHeader(
                  title: AppLocalizations.of(context)!.forgotPassword,
                  description:
                      AppLocalizations.of(context)!.forgotPasswordDescription,
                  illustration: Assets.illustrationsForgotPassword,
                ),
                const SizedBox(height: 32),
                const ForgotPasswordForm(),
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
