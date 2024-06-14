import 'package:flugram/app/services/spaceflight/models/spaceflight_article_model.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
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
      child:
          BlowePaginationListView<SpaceArticlesBloc, SpaceflightArticleModel>(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemBuilder: (context, item) => SpaceArticleCard(item),
      ),
    );
  }
}
