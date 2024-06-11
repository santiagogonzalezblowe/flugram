import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/create_page/logic/create_page_blocs_provider.dart';
import 'package:flugram/features/create_page/logic/create_page_listener.dart';
import 'package:flugram/features/create_page/ui/widgets/create_page_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CreatePagePage extends StatelessWidget {
  const CreatePagePage({
    super.key,
    required this.flugramId,
  });

  static String get routePath => 'create-page';
  static String get routeName => 'createPage';

  static void go(BuildContext context, String flugramId) => context.goNamed(
        routeName,
        pathParameters: {'flugramId': flugramId},
      );

  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return CreatePageBlocsProvider(
      flugramId: flugramId,
      child: CreatePageListener(
        flugramId: flugramId,
        child: Scaffold(
          appBar: AppBar(),
          body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            children: [
              FormHeader(
                title: AppLocalizations.of(context)!.createPage,
                description:
                    AppLocalizations.of(context)!.createPageDescription,
                illustration: Assets.illustrationsCreate,
              ),
              const SizedBox(height: 32),
              const CreatePageForm(),
            ],
          ),
        ),
      ),
    );
  }
}
