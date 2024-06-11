import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/create_flugram/logic/create_flugram_blocs_provider.dart';
import 'package:flugram/features/create_flugram/logic/create_flugram_listener.dart';
import 'package:flugram/features/create_flugram/ui/widgets/create_flugram_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CreateFlugramPage extends StatelessWidget {
  const CreateFlugramPage({super.key});

  static String get routePath => 'create-flugram';
  static String get routeName => 'createFlugram';

  static void go(BuildContext context) => context.goNamed(routeName);

  @override
  Widget build(BuildContext context) {
    return CreateFlugramBlocsProvider(
      child: CreateFlugramListener(
        child: Scaffold(
          appBar: AppBar(),
          body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            children: [
              FormHeader(
                title: AppLocalizations.of(context)!.createFlugram,
                description:
                    AppLocalizations.of(context)!.createFlugramDescription,
                illustration: Assets.illustrationsCreate,
              ),
              const SizedBox(height: 32),
              const CreateFlugramForm(),
            ],
          ),
        ),
      ),
    );
  }
}
