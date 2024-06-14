import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/delete_bloc/logic/delete_bloc_blocs_provider.dart';
import 'package:flugram/features/delete_bloc/logic/delete_bloc_listener.dart';
import 'package:flugram/features/delete_bloc/ui/widget/delete_bloc_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DeleteBlocPage extends StatelessWidget {
  const DeleteBlocPage({
    super.key,
    required this.flugramId,
    required this.blocId,
    required this.parentPageIds,
  });

  static String get routePath => 'delete-bloc';
  static String get routeName => 'deleteBloc';

  static void go(
    BuildContext context,
    String flugramId,
    String blocId,
    List<String> parentPageIds,
  ) =>
      context.goNamed(
        routeName,
        pathParameters: {
          'flugramId': flugramId,
          'blocId': blocId,
          'parentPageIds': parentPageIds.join(','),
        },
      );

  final String flugramId;
  final String blocId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return DeleteBlocBlocsProvider(
      flugramId: flugramId,
      blocId: blocId,
      parentPageIds: parentPageIds,
      child: DeleteBlocListener(
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
                title: AppLocalizations.of(context)!.deleteBloc,
                description:
                    AppLocalizations.of(context)!.deleteBlocDescription,
              ),
              const SizedBox(height: 32),
              const DeleteBlocForm(),
            ],
          ),
        ),
      ),
    );
  }
}
