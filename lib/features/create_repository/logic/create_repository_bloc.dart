import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/repositories_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class CreateRepositoryBloc extends BloweLoadBloc<void, CreateRepositoryParams> {
  CreateRepositoryBloc(
    this._repositoriesRepository,
    this.flugramId,
  );

  final RepositoriesRepository _repositoriesRepository;
  final String flugramId;

  @override
  Future<void> load(CreateRepositoryParams params) =>
      _repositoriesRepository.createRepository(flugramId, params);
}

class CreateRepositoryParams {
  CreateRepositoryParams(
    this.name,
    this.description,
  );

  final String name;
  final String description;

  Map<String, dynamic> toJson(String userId) {
    return {
      'name': name,
      'description': description,
      'createdAt': Timestamp.now(),
      'createdBy': userId,
    };
  }
}
