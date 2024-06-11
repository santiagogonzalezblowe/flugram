import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/delete_flugram/logic/delete_flugram_blocs_provider.dart';
import 'package:flugram/features/delete_flugram/logic/delete_flugram_listener.dart';
import 'package:flugram/features/delete_flugram/ui/widget/delete_flugram_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DeleteFlugramPage extends StatelessWidget {
  const DeleteFlugramPage(
    this.flugramId, {
    super.key,
  });

  static String get routePath => 'delete-flugram';
  static String get routeName => 'deleteFlugram';

  static void go(BuildContext context, String flugramId) => context.goNamed(
        routeName,
        pathParameters: {'flugramId': flugramId},
      );

  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return DeleteFlugramBlocsProvider(
      flugramId: flugramId,
      child: DeleteFlugramListener(
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
                title: AppLocalizations.of(context)!.deleteFlugram,
                description:
                    AppLocalizations.of(context)!.deleteFlugramDescription,
              ),
              const SizedBox(height: 32),
              const DeleteFlugramForm(),
            ],
          ),
        ),
      ),
    );
  }
}
