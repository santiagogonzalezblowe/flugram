import 'package:flugram/app/services/spaceflight/models/spaceflight_article_model.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class SpaceflightArticlesResponseModel
    extends BlowePaginationModel<SpaceflightArticleModel> {
  const SpaceflightArticlesResponseModel({
    required super.totalCount,
    required super.items,
  });

  factory SpaceflightArticlesResponseModel.fromJson(Map<String, dynamic> json) {
    return SpaceflightArticlesResponseModel(
      totalCount: json['count'] as int,
      items: (json['results'] as List<dynamic>?)
              ?.map(
                (item) => SpaceflightArticleModel.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );
  }
}
