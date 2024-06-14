import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/create_repository/logic/create_repository_bloc.dart';
import 'package:flugram/features/home/models/repository_model.dart';

class RepositoriesRepository extends AuthenticatedRepository {
  RepositoriesRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> createRepository(
    String flugramId,
    CreateRepositoryParams params,
  ) =>
      _repositoriesCollection(flugramId).add(params.toJson(userId));

  Stream<List<RepositoryModel>> watchRepositories(String flugramId) =>
      _repositoriesCollection(flugramId).snapshots().map(
            (snapshot) =>
                snapshot.docs.map(RepositoryModel.fromFirestore).toList(),
          );

  Future<List<RepositoryModel>> loadRepositories(String flugramId) async {
    final snapshot = await _repositoriesCollection(flugramId).get();
    return snapshot.docs.map(RepositoryModel.fromFirestore).toList();
  }

  Future<List<RepositoryModel>> loadRepositoriesByIds(
    String flugramId,
    List<String> ids,
  ) async {
    final snapshot = await _repositoriesCollection(flugramId)
        .where(FieldPath.documentId, whereIn: ids)
        .get();
    return snapshot.docs.map(RepositoryModel.fromFirestore).toList();
  }

  CollectionReference<Map<String, dynamic>> _repositoriesCollection(
    String flugramId,
  ) =>
      _firestore.collection('flugrams').doc(flugramId).collection(
            'repositories',
          );
}
