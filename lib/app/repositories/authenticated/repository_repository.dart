import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/home/models/repository_model.dart';

class RepositoryRepository extends AuthenticatedRepository {
  RepositoryRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> deleteRepository(String flugramId, String repositoryId) =>
      _repositoryDocument(flugramId, repositoryId).delete();

  Future<void> updateRepository(String flugramId, RepositoryModel params) =>
      _repositoryDocument(flugramId, params.id).update(params.toJson);

  Stream<RepositoryModel> watchRepository(
    String flugramId,
    String repositoryId,
  ) =>
      _repositoryDocument(flugramId, repositoryId).snapshots().map(
            RepositoryModel.fromFirestore,
          );

  Future<RepositoryModel> getRepository(
    String flugramId,
    String repositoryId,
  ) async {
    final snapshot = await _repositoryDocument(flugramId, repositoryId).get();
    return RepositoryModel.fromFirestore(snapshot);
  }

  DocumentReference<Map<String, dynamic>> _repositoryDocument(
    String flugramId,
    String repositoryId,
  ) {
    return _firestore
        .collection('flugrams')
        .doc(flugramId)
        .collection('repositories')
        .doc(repositoryId);
  }
}
