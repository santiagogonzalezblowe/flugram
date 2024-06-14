import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/create_bloc/logic/create_bloc_blocs_provider.dart';
import 'package:flugram/features/create_bloc/logic/create_bloc_listener.dart';
import 'package:flugram/features/create_bloc/ui/widgets/create_bloc_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CreateBlocPage extends StatelessWidget {
  const CreateBlocPage({
    super.key,
    required this.flugramId,
    required this.parentPageIds,
  });

  static String get routePath => 'create-bloc/:parentPageIds';
  static String get routeName => 'createBloc';

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
    return CreateBlocBlocsProvider(
      flugramId: flugramId,
      child: CreateBlocListener(
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
                title: AppLocalizations.of(context)!.createBloc,
                description:
                    AppLocalizations.of(context)!.createBlocDescription,
                illustration: Assets.illustrationsCreate,
              ),
              const SizedBox(height: 32),
              CreateBlocForm(parentPageIds: parentPageIds),
            ],
          ),
        ),
      ),
    );
  }
}
