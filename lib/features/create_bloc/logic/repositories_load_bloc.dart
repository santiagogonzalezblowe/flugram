import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/features/home/models/repository_model.dart';

class RepositoriesLoadBloc
    extends BloweLoadBloc<List<RepositoryModel>, BloweNoParams> {
  RepositoriesLoadBloc(this._repositoriesRepository, this.flugramId);

  final RepositoriesRepository _repositoriesRepository;
  final String flugramId;

  @override
  Future<List<RepositoryModel>> load(BloweNoParams params) =>
      _repositoriesRepository.loadRepositories(flugramId);
}
