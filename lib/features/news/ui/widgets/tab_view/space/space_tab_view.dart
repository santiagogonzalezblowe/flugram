import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/services/space/models/space_article_model.dart';
import 'package:flugram/features/news/logic/space_articles_bloc.dart';
import 'package:flugram/features/news/ui/widgets/tab_view/space/space_article_card.dart';
import 'package:flugram/features/news/ui/widgets/tab_view/space/space_tab_view_blocs_provider.dart';
import 'package:flutter/material.dart';

class SpaceTabView extends StatefulWidget {
  const SpaceTabView({super.key});

  @override
  State<SpaceTabView> createState() => _SpaceTabViewState();
}

class _SpaceTabViewState extends State<SpaceTabView>
    with AutomaticKeepAliveClientMixin<SpaceTabView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SpaceTabViewBlocsProvider(
      child: BlowePaginationListView<SpaceArticlesBloc, SpaceArticleModel,
          BloweNoParams, DateTime>(
        padding: const EdgeInsets.only(top: 12),
        itemBuilder: (context, item) => SpaceArticleCard(item),
        paramsProvider: () => const BloweNoParams(),
        groupBy: (item) => DateTime(
          item.publishedAt.year,
          item.publishedAt.month,
          item.publishedAt.day,
        ),
        groupHeaderBuilder: (context, date, list) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            date.toLocal().toIso8601String().split('T').first,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        startWidget: const Text('Start'),
        endWidget: const Text('End'),
      ),
    );
  }
}
