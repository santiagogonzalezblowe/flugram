import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/delete_subpage/logic/delete_subpage_blocs_provider.dart';
import 'package:flugram/features/delete_subpage/logic/delete_subpage_listener.dart';
import 'package:flugram/features/delete_subpage/ui/widget/delete_page_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DeleteSubpagePage extends StatelessWidget {
  const DeleteSubpagePage({
    super.key,
    required this.flugramId,
    required this.pageId,
    required this.parentPageIds,
  });

  static String get routePath => 'delete-subpage';
  static String get routeName => 'deleteSubpage';

  static void go(
    BuildContext context,
    String flugramId,
    String pageId,
    List<String> parentPageIds,
  ) =>
      context.goNamed(
        routeName,
        pathParameters: {
          'flugramId': flugramId,
          'pageId': pageId,
          'parentPageIds': parentPageIds.join(','),
        },
      );

  final String flugramId;
  final String pageId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return DeleteSubpageBlocsProvider(
      flugramId: flugramId,
      pageId: pageId,
      parentPageIds: parentPageIds,
      child: DeleteSubpageListener(
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
                illustration: Assets.illustrationsDelete,
                title: AppLocalizations.of(context)!.deletePage,
                description:
                    AppLocalizations.of(context)!.deletePageDescription,
              ),
              const SizedBox(height: 32),
              const DeleteSubpageForm(),
            ],
          ),
        ),
      ),
    );
  }
}
