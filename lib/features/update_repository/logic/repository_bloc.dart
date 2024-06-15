import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/repository_repository.dart';
import 'package:flugram/features/home/models/repository_model.dart';

class RepositoryBloc extends BloweLoadBloc<RepositoryModel, BloweNoParams> {
  RepositoryBloc(
    this._flugramId,
    this._repositoryId,
    this._repositoryRepository,
  );

  final String _flugramId;
  final String _repositoryId;
  final RepositoryRepository _repositoryRepository;

  @override
  Future<RepositoryModel> load(BloweNoParams params) =>
      _repositoryRepository.getRepository(_flugramId, _repositoryId);
}
