import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/repository_model.dart';

class RepositoriesBloc
    extends BloweWatchBloc<List<RepositoryModel>, BloweNoParams> {
  RepositoriesBloc(this._repositoriesRepository, this.flugramId);

  final RepositoriesRepository _repositoriesRepository;
  final String flugramId;

  @override
  Stream<List<RepositoryModel>> watch(BloweNoParams params) =>
      _repositoriesRepository.watchRepositories(flugramId);
}
