import 'dart:convert';

import 'package:flugram/app/services/spaceflight/models/spaceflight_article_model.dart';
import 'package:flugram/app/services/spaceflight/models/spaceflight_articles_response_model.dart';
import 'package:http/http.dart' as http;

class SpaceflightService {
  SpaceflightService();

  static const String _baseUrl =
      'https://api.spaceflightnewsapi.net/v4/articles/';

  Future<SpaceflightArticlesResponseModel> loadArticles(int page) async {
    final offset = page * 10;
    final url = Uri.parse('$_baseUrl?limit=10&offset=$offset');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body) as Map<String, dynamic>;

      return SpaceflightArticlesResponseModel.fromJson(map);
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<SpaceflightArticleModel> loadArticle(int id) async {
    final url = Uri.parse('$_baseUrl&id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body) as Map<String, dynamic>;

      return SpaceflightArticleModel.fromJson(map);
    } else {
      throw Exception('Failed to load article $id');
    }
  }
}
