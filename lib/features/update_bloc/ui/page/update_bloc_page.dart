import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/update_bloc/logic/bloc_bloc.dart';
import 'package:flugram/features/update_bloc/logic/update_bloc_blocs_provider.dart';
import 'package:flugram/features/update_bloc/logic/update_bloc_listener.dart';
import 'package:flugram/features/update_bloc/ui/widgets/update_bloc_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class UpdateBlocPage extends StatelessWidget {
  const UpdateBlocPage({
    super.key,
    required this.blocId,
    required this.flugramId,
    required this.parentPageIds,
  });

  static String get routePath => 'update-bloc/:parentPageIds/:blocId';
  static String get routeName => 'updateBloc';

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

  final String blocId;
  final String flugramId;
  final List<String> parentPageIds;

  @override
  Widget build(BuildContext context) {
    return UpdateBlocBlocsProvider(
      flugramId: flugramId,
      blocId: blocId,
      parentPageIds: parentPageIds,
      child: UpdateBlocListener(
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<BlocBloc, BloweBlocState>(
            builder: (context, state) {
              if (state is BloweCompleted<BlocBlocData>) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  children: [
                    FormHeader(
                      illustration: Assets.illustrationsUpdate,
                      title: AppLocalizations.of(context)!.updateBloc,
                      description:
                          AppLocalizations.of(context)!.updateBlocDescription,
                    ),
                    const SizedBox(height: 32),
                    UpdateBlocForm(
                      bloc: state.data.bloc,
                      repositories: state.data.repositories,
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
