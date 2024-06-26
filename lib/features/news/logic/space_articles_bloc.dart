import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/space/space_repository.dart';
import 'package:flugram/app/services/space/models/space_articles_response_model.dart';

class SpaceArticlesBloc
    extends BlowePaginationBloc<SpaceArticlesResponseModel, BloweNoParams> {
  SpaceArticlesBloc(this._spaceflightRepository);

  final SpaceRepository _spaceflightRepository;

  @override
  Future<SpaceArticlesResponseModel> load(
    BloweNoParams params,
    int page,
  ) =>
      _spaceflightRepository.loadArticles(page);
}
