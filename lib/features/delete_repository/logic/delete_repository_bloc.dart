import 'package:flugram/app/repositories/authenticated/repository_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class DeleteRepositoryBloc extends BloweLoadBloc<void, BloweNoParams> {
  DeleteRepositoryBloc(
    this._flugramId,
    this._repositoryId,
    this._pageRepository,
  );

  final String _flugramId;
  final String _repositoryId;
  final RepositoryRepository _pageRepository;

  @override
  Future<void> load(BloweNoParams params) =>
      _pageRepository.deleteRepository(_flugramId, _repositoryId);
}
