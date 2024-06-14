import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/create_repository/ui/page/create_repository_page.dart';
import 'package:flugram/features/flugram/logic/repositories_watch_bloc.dart';
import 'package:flugram/features/flugram/ui/widgets/repository_card.dart';
import 'package:flugram/features/home/models/repository_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoriesListView extends StatelessWidget {
  const RepositoriesListView(
    this.flugramId, {
    super.key,
  });

  final String flugramId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoriesWatchBloc, BloweBlocState>(
      builder: (context, state) {
        if (state is BloweInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BloweError) {
          return Center(
            child: Text(state.error.toString()),
          );
        }

        if (state is BloweCompleted<List<RepositoryModel>>) {
          if (state.data.isEmpty) {
            return Center(
              child: ElevatedButton(
                onPressed: () => CreateRepositoryPage.go(context, flugramId),
                child: Text(AppLocalizations.of(context)!.createRepository),
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == state.data.length) {
                return Center(
                  child: IconButton(
                    onPressed: () => CreateRepositoryPage.go(
                      context,
                      flugramId,
                    ),
                    icon: const Icon(Icons.add),
                  ),
                );
              }

              return RepositoryCard(
                repository: state.data[index],
                flugramId: flugramId,
              );
            },
            itemCount: state.data.length + 1,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
