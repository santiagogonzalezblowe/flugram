import 'package:collection/collection.dart';
import 'package:flugram/app/services/space/models/space_article_model.dart';
import 'package:flugram/app/services/space/models/space_articles_response_model.dart';
import 'package:flugram/app/services/space/space_service.dart';

class SpaceRepository {
  SpaceRepository(this.service);

  final SpaceService service;

  SpaceArticlesResponseModel? _lastArticlesResponseModel;

  Future<SpaceArticlesResponseModel> loadArticles(int page) async {
    final spaceflightArticlesResponse = await service.loadArticles(page);

    if (page != 0) {
      final items = _lastArticlesResponseModel?.items ?? [];

      spaceflightArticlesResponse.items.insertAll(0, items);
    }

    _lastArticlesResponseModel = spaceflightArticlesResponse;

    return spaceflightArticlesResponse;
  }

  Future<SpaceArticleModel> loadArticle(int id) {
    final article = _lastArticlesResponseModel?.items.firstWhereOrNull(
      (element) => element.id == id,
    );

    if (article != null) return Future.value(article);

    return service.loadArticle(id);
  }
}
