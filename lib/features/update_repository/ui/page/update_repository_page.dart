import 'package:flugram/app/constants/assets.dart';
import 'package:flugram/app/widgets/form_header.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/repository_model.dart';
import 'package:flugram/features/update_repository/logic/repository_bloc.dart';
import 'package:flugram/features/update_repository/logic/update_repository_blocs_provider.dart';
import 'package:flugram/features/update_repository/logic/update_repository_listener.dart';
import 'package:flugram/features/update_repository/ui/widgets/update_repository_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class UpdateRepositoryPage extends StatelessWidget {
  const UpdateRepositoryPage({
    super.key,
    required this.repositoryId,
    required this.flugramId,
  });

  static String get routePath => 'update-repository/:repositoryId';
  static String get routeName => 'updateRepository';

  static void go(BuildContext context, String flugramId, String repositoryId) =>
      context.goNamed(
        routeName,
        pathParameters: {
          'flugramId': flugramId,
          'repositoryId': repositoryId,
        },
      );

  final String repositoryId;
  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return UpdateRepositoryBlocsProvider(
      flugramId: flugramId,
      repositoryId: repositoryId,
      child: UpdateRepositoryListener(
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<RepositoryBloc, BloweBlocState>(
            builder: (context, state) {
              if (state is BloweCompleted<RepositoryModel>) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  children: [
                    FormHeader(
                      illustration: Assets.illustrationsUpdate,
                      title: AppLocalizations.of(context)!.updateRepository,
                      description: AppLocalizations.of(context)!
                          .updateRepositoryDescription,
                    ),
                    const SizedBox(height: 32),
                    UpdateRepositoryForm(
                      repository: state.data,
                      flugramId: flugramId,
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
