import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/create_repository/logic/create_repository_blocs_provider.dart';
import 'package:flugram/features/create_repository/logic/create_repository_listener.dart';
import 'package:flugram/features/create_repository/ui/widgets/create_repository_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CreateRepositoryPage extends StatelessWidget {
  const CreateRepositoryPage({
    super.key,
    required this.flugramId,
  });

  static String get routePath => 'create-repository';
  static String get routeName => 'createRepository';

  static void go(BuildContext context, String flugramId) => context.goNamed(
        routeName,
        pathParameters: {'flugramId': flugramId},
      );

  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return CreateRepositoryBlocsProvider(
      flugramId: flugramId,
      child: CreateRepositoryListener(
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
                title: AppLocalizations.of(context)!.createRepository,
                description:
                    AppLocalizations.of(context)!.createRepositoryDescription,
                illustration: Assets.illustrationsCreate,
              ),
              const SizedBox(height: 32),
              const CreateRepositoryForm(),
            ],
          ),
        ),
      ),
    );
  }
}
