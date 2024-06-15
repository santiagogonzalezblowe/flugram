import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/bloc_repository.dart';
import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/features/home/models/bloc_model.dart';
import 'package:flugram/features/home/models/repository_model.dart';

class BlocBloc extends BloweLoadBloc<BlocBlocData, BloweNoParams> {
  BlocBloc(
    this._flugramId,
    this._blocId,
    this._parentPageIds,
    this._blocRepository,
    this._repositoriesRepository,
  );

  final String _flugramId;
  final String _blocId;
  final List<String> _parentPageIds;
  final BlocRepository _blocRepository;
  final RepositoriesRepository _repositoriesRepository;

  @override
  Future<BlocBlocData> load(BloweNoParams params) async {
    final bloc = await _blocRepository.loadBloc(
      _flugramId,
      _blocId,
      _parentPageIds,
    );

    final repositories = bloc.repositoryIds.isEmpty
        ? <RepositoryModel>[]
        : await _repositoriesRepository.loadRepositoriesByIds(
            _flugramId,
            bloc.repositoryIds,
          );

    return BlocBlocData(bloc: bloc, repositories: repositories);
  }
}

class BlocBlocData {
  const BlocBlocData({
    required this.bloc,
    required this.repositories,
  });

  final BlocModel bloc;
  final List<RepositoryModel> repositories;
}
