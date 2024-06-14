import 'package:flugram/app/repositories/spaceflight/spaceflight_repository.dart';
import 'package:flugram/app/services/spaceflight/models/spaceflight_articles_response_model.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/blowe_bloc/src/logic/blowe_pagination_bloc.dart';

class SpaceArticlesBloc extends BlowePaginationBloc<
    SpaceflightArticlesResponseModel, BloweNoParams> {
  SpaceArticlesBloc(this._spaceflightRepository);

  final SpaceflightRepository _spaceflightRepository;

  @override
  Future<SpaceflightArticlesResponseModel> load(
    BloweNoParams params,
    int page,
  ) =>
      _spaceflightRepository.loadArticles(page);
}
