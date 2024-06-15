import 'package:flugram/app/services/space/models/space_article_model.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/space_article/logic/space_article_bloc.dart';
import 'package:flugram/features/space_article/ui/widgets/space_article_loaded.dart';
import 'package:flutter/material.dart';

class SpaceArticleBuilder extends StatelessWidget {
  const SpaceArticleBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceArticleBloc, BloweBlocState>(
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

        if (state is BloweCompleted<SpaceArticleModel>) {
          return SpaceArticleLoaded(state.data);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
