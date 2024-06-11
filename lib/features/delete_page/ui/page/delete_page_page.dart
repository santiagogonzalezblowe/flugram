import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/delete_page/logic/delete_page_blocs_provider.dart';
import 'package:flugram/features/delete_page/logic/delete_page_listener.dart';
import 'package:flugram/features/delete_page/ui/widget/delete_page_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DeletePagePage extends StatelessWidget {
  const DeletePagePage({
    super.key,
    required this.flugramId,
    required this.pageId,
  });

  static String get routePath => 'delete-page';
  static String get routeName => 'deletePage';

  static void go(BuildContext context, String flugramId, String pageId) =>
      context.goNamed(
        routeName,
        pathParameters: {
          'flugramId': flugramId,
          'pageId': pageId,
        },
      );

  final String flugramId;
  final String pageId;

  @override
  Widget build(BuildContext context) {
    return DeletePageBlocsProvider(
      flugramId: flugramId,
      pageId: pageId,
      child: DeletePageListener(
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
              const DeletePageForm(),
            ],
          ),
        ),
      ),
    );
  }
}
