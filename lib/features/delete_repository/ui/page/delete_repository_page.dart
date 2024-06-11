import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/delete_repository/logic/delete_repository_blocs_provider.dart';
import 'package:flugram/features/delete_repository/logic/delete_repository_listener.dart';
import 'package:flugram/features/delete_repository/ui/widget/delete_repository_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DeleteRepositoryPage extends StatelessWidget {
  const DeleteRepositoryPage({
    super.key,
    required this.flugramId,
    required this.repositoryId,
  });

  static String get routePath => 'delete-repository';
  static String get routeName => 'deleteRepository';

  static void go(BuildContext context, String flugramId, String repositoryId) =>
      context.goNamed(
        routeName,
        pathParameters: {
          'flugramId': flugramId,
          'repositoryId': repositoryId,
        },
      );

  final String flugramId;
  final String repositoryId;

  @override
  Widget build(BuildContext context) {
    return DeleteRepositoryBlocsProvider(
      flugramId: flugramId,
      repositoryId: repositoryId,
      child: DeleteRepositoryListener(
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
                title: AppLocalizations.of(context)!.deleteRepository,
                description:
                    AppLocalizations.of(context)!.deleteRepositoryDescription,
              ),
              const SizedBox(height: 32),
              const DeleteRepositoryForm(),
            ],
          ),
        ),
      ),
    );
  }
}
