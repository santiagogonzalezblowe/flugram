import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/home/models/bloc_model.dart';

class BlocRepository extends AuthenticatedRepository {
  BlocRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> deleteBloc(
    String flugramId,
    String blocId,
    List<String> parentPageIds,
  ) =>
      _getBlocDocument(flugramId, blocId, parentPageIds).delete();

  Future<void> updateBloc(
    String flugramId,
    BlocModel params,
    List<String> parentPageIds,
  ) =>
      _getBlocDocument(
        flugramId,
        params.id,
        parentPageIds,
      ).update(params.toJson);

  Stream<BlocModel> watchBloc(
    String flugramId,
    String blocId,
    List<String> parentPageIds,
  ) =>
      _getBlocDocument(
        flugramId,
        blocId,
        parentPageIds,
      ).snapshots().map(
            BlocModel.fromFirestore,
          );

  Future<BlocModel> loadBloc(
    String flugramId,
    String blocId,
    List<String> parentPageIds,
  ) async {
    final snapshot = await _getBlocDocument(
      flugramId,
      blocId,
      parentPageIds,
    ).get();
    return BlocModel.fromFirestore(snapshot);
  }

  DocumentReference<Map<String, dynamic>> _getBlocDocument(
    String flugramId,
    String blocId,
    List<String> parentPageIds,
  ) {
    final pageId = parentPageIds.last;
    final newParentPageIds = parentPageIds.sublist(
      0,
      parentPageIds.length - 1,
    );

    var collection =
        _firestore.collection('flugrams').doc(flugramId).collection(
              'pages',
            );

    for (final parentId in newParentPageIds) {
      collection = collection.doc(parentId).collection('pages');
    }

    return collection.doc(pageId).collection('blocs').doc(blocId);
  }
}
