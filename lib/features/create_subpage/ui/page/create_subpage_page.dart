import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/create_subpage/logic/create_subpage_blocs_provider.dart';
import 'package:flugram/features/create_subpage/logic/create_subpage_listener.dart';
import 'package:flugram/features/create_subpage/ui/widgets/create_subpage_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CreateSubpagePage extends StatelessWidget {
  const CreateSubpagePage({
    super.key,
    required this.flugramId,
    required this.parentPageIds,
  });

  static String get routePath => 'create-subpage/:parentPageIds';
  static String get routeName => 'createSubpage';

  static void go(
    BuildContext context,
    String flugramId,
    List<String> parentPageIds,
  ) =>
      context.goNamed(
        routeName,
        pathParameters: {
          'flugramId': flugramId,
          'parentPageIds': parentPageIds.join(','),
        },
      );

  final String flugramId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return CreateSubpageBlocsProvider(
      flugramId: flugramId,
      child: CreateSubpageListener(
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
                title: AppLocalizations.of(context)!.createSubpage,
                description:
                    AppLocalizations.of(context)!.createSubpageDescription,
                illustration: Assets.illustrationsCreate,
              ),
              const SizedBox(height: 32),
              CreateSubpageForm(parentPageIds: parentPageIds),
            ],
          ),
        ),
      ),
    );
  }
}
