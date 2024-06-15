import 'package:flugram/app/services/space/models/space_article_model.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class SpaceArticlesResponseModel
    extends BlowePaginationModel<SpaceArticleModel> {
  const SpaceArticlesResponseModel({
    required super.totalCount,
    required super.items,
  });

  factory SpaceArticlesResponseModel.fromJson(Map<String, dynamic> json) {
    return SpaceArticlesResponseModel(
      totalCount: json['count'] as int,
      items: (json['results'] as List<dynamic>?)
              ?.map(
                (item) => SpaceArticleModel.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );
  }
}
