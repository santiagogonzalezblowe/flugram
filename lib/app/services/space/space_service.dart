import 'dart:convert';

import 'package:flugram/app/services/space/models/space_article_model.dart';
import 'package:flugram/app/services/space/models/space_articles_response_model.dart';
import 'package:http/http.dart' as http;

class SpaceService {
  SpaceService();

  static const String _baseUrl =
      'https://api.spaceflightnewsapi.net/v4/articles/';

  Future<SpaceArticlesResponseModel> loadArticles(int page) async {
    final offset = page * 10;
    final url = Uri.parse('$_baseUrl?limit=10&offset=$offset');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body) as Map<String, dynamic>;

      return SpaceArticlesResponseModel.fromJson(map);
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<SpaceArticleModel> loadArticle(int id) async {
    final url = Uri.parse('$_baseUrl&id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body) as Map<String, dynamic>;

      return SpaceArticleModel.fromJson(map);
    } else {
      throw Exception('Failed to load article $id');
    }
  }
}
