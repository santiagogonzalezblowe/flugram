import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/blocs_repository.dart';

class CreateBlocBloc extends BloweLoadBloc<void, CreateBlocParams> {
  CreateBlocBloc(this._blocsRepository, this._flugramId);

  final BlocsRepository _blocsRepository;
  final String _flugramId;

  @override
  Future<void> load(CreateBlocParams params) =>
      _blocsRepository.createBloc(_flugramId, params);
}

class CreateBlocParams {
  CreateBlocParams(
    this.name,
    this.description,
    this.parentPageIds,
    this.repositoryIds,
  );

  final String name;
  final String description;
  final List<String> parentPageIds;
  final List<String> repositoryIds;

  Map<String, dynamic> toJson(String userId) {
    return {
      'name': name,
      'description': description,
      'createdAt': Timestamp.now(),
      'createdBy': userId,
      'repositoryIds': repositoryIds,
    };
  }
}
