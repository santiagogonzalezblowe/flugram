import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/flugram/logic/flugram_blocs_provider.dart';
import 'package:flugram/features/flugram/logic/flugram_watch_bloc.dart';
import 'package:flugram/features/flugram/ui/widgets/flugram_app_bar.dart';
import 'package:flugram/features/flugram/ui/widgets/pages_page_view.dart';
import 'package:flugram/features/flugram/ui/widgets/repositories_list_view.dart';
import 'package:flugram/features/home/models/flugram_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FlugramPage extends StatelessWidget {
  const FlugramPage(
    this.flugramId, {
    super.key,
  });

  final String flugramId;

  static String get routePath => 'flugram/:flugramId';
  static String get routeName => 'flugram';

  static void go(BuildContext context, String flugramId) => context.goNamed(
        routeName,
        pathParameters: {'flugramId': flugramId},
      );

  @override
  Widget build(BuildContext context) {
    return FlugramBlocsProvider(
      flugramId: flugramId,
      child: BlocBuilder<FlugramWatchBloc, BloweState>(
        builder: (context, state) {
          final flugram =
              state is BloweCompleted<FlugramModel> ? state.data : null;

          return Scaffold(
            appBar: FlugramAppBar(context, flugram: flugram),
            body: getBody(state),
          );
        },
      ),
    );
  }

  Widget getBody(BloweState state) {
    if (state is BloweCompleted<FlugramModel>) {
      return Column(
        children: [
          Expanded(
            flex: 3,
            child: PagesPageView(state.data.id),
          ),
          const Divider(),
          Expanded(
            child: RepositoriesListView(state.data.id),
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
  }
}
