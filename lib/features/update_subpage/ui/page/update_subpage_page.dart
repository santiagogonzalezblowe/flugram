import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_subpage/logic/subpage_bloc.dart';
import 'package:flugram/features/update_subpage/logic/update_subpage_blocs_provider.dart';
import 'package:flugram/features/update_subpage/logic/update_subpage_listener.dart';
import 'package:flugram/features/update_subpage/ui/widgets/update_page_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class UpdateSubpagePage extends StatelessWidget {
  const UpdateSubpagePage({
    super.key,
    required this.pageId,
    required this.flugramId,
    required this.parentPageIds,
  });

  static String get routePath => 'update-subpage/:parentPageIds/:pageId';
  static String get routeName => 'updateSubpage';

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

  final String pageId;
  final String flugramId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return UpdateSubpageBlocsProvider(
      flugramId: flugramId,
      pageId: pageId,
      parentPageIds: parentPageIds,
      child: UpdateSubpageListener(
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<SubpageBloc, BloweState>(
            builder: (context, state) {
              if (state is BloweCompleted<PageModel>) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  children: [
                    FormHeader(
                      illustration: Assets.illustrationsUpdate,
                      title: AppLocalizations.of(context)!.updateSubpage,
                      description: AppLocalizations.of(context)!
                          .updateSubpageDescription,
                    ),
                    const SizedBox(height: 32),
                    UpdateSubpageForm(
                      page: state.data,
                      flugramId: flugramId,
                      parentPageIds: parentPageIds,
                    ),
                  ],
                );
              }
              if (state is BloweInProgress) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is BloweError) {
                return Center(
                  child: Text(state.error.toString()),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
