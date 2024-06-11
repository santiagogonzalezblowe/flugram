import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';
import 'package:flugram/features/update_page/logic/page_bloc.dart';
import 'package:flugram/features/update_page/logic/update_page_blocs_provider.dart';
import 'package:flugram/features/update_page/logic/update_page_listener.dart';
import 'package:flugram/features/update_page/ui/widgets/update_page_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class UpdatePagePage extends StatelessWidget {
  const UpdatePagePage({
    super.key,
    required this.pageId,
    required this.flugramId,
  });

  static String get routePath => 'update-page/:pageId';
  static String get routeName => 'updatePage';

  static void go(BuildContext context, String flugramId, String pageId) =>
      context.goNamed(
        routeName,
        pathParameters: {
          'flugramId': flugramId,
          'pageId': pageId,
        },
      );

  final String pageId;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return UpdatePageBlocsProvider(
      flugramId: flugramId,
      pageId: pageId,
      child: UpdatePageListener(
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<PageBloc, BloweBlocState>(
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
                      title: AppLocalizations.of(context)!.updatePage,
                      description:
                          AppLocalizations.of(context)!.updatePageDescription,
                    ),
                    const SizedBox(height: 32),
                    UpdatePageForm(page: state.data, flugramId: flugramId),
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
