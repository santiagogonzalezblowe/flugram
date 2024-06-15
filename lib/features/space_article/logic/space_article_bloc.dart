import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/space/space_repository.dart';
import 'package:flugram/app/services/space/models/space_article_model.dart';

class SpaceArticleBloc extends BloweLoadBloc<SpaceArticleModel, int> {
  SpaceArticleBloc(this._spaceflightRepository);

  final SpaceRepository _spaceflightRepository;

  @override
  Future<SpaceArticleModel> load(int params) =>
      _spaceflightRepository.loadArticle(params);
}
