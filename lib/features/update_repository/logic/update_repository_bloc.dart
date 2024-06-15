import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/repository_repository.dart';
import 'package:flugram/features/home/models/repository_model.dart';

class UpdateRepositoryBloc extends BloweLoadBloc<void, RepositoryModel> {
  UpdateRepositoryBloc(
    this._flugramId,
    this._repositoryRepository,
  );

  final RepositoryRepository _repositoryRepository;
  final String _flugramId;

  @override
  Future<void> load(RepositoryModel params) =>
      _repositoryRepository.updateRepository(_flugramId, params);
}
