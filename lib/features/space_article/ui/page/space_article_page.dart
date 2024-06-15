import 'package:flugram/features/space_article/logic/space_article_blocs_provider.dart';
import 'package:flugram/features/space_article/ui/widgets/space_article_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpaceArticlePage extends StatelessWidget {
  const SpaceArticlePage(this.articleId, {super.key});

  static String get routePath => 'space-article/:articleId';
  static String get routeName => 'spaceArticle';

  static void go(BuildContext context, int articleId) => context.goNamed(
        routeName,
        pathParameters: {'articleId': articleId.toString()},
      );

  final int articleId;

  @override
  Widget build(BuildContext context) {
    return SpaceArticleBlocsProvider(
      articleId: articleId,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        body: const SpaceArticleBuilder(),
      ),
    );
  }
}
