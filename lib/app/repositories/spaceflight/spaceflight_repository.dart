import 'package:collection/collection.dart';
import 'package:flugram/app/services/spaceflight/models/spaceflight_article_model.dart';
import 'package:flugram/app/services/spaceflight/models/spaceflight_articles_response_model.dart';
import 'package:flugram/app/services/spaceflight/spaceflight_service.dart';

class SpaceflightRepository {
  SpaceflightRepository(this.service);

  final SpaceflightService service;

  SpaceflightArticlesResponseModel? lastArticlesResponseModel;

  Future<SpaceflightArticlesResponseModel> loadArticles(int page) async {
    final spaceflightArticlesResponse = await service.loadArticles(page);

    if (page != 0) {
      final items = lastArticlesResponseModel?.items ?? [];

      spaceflightArticlesResponse.items.insertAll(0, items);
    }

    lastArticlesResponseModel = spaceflightArticlesResponse;

    return spaceflightArticlesResponse;
  }

  Future<SpaceflightArticleModel> loadArticle(int id) {
    final article = lastArticlesResponseModel?.items.firstWhereOrNull(
      (element) => element.id == id,
    );

    if (article != null) return Future.value(article);

    return service.loadArticle(id);
  }
}
