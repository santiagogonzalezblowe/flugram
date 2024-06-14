import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/create_bloc/logic/create_bloc_bloc.dart';
import 'package:flugram/features/home/models/bloc_model.dart';

class BlocsRepository extends AuthenticatedRepository {
  BlocsRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> createBloc(String flugramId, CreateBlocParams params) =>
      _getBlocsCollection(
        flugramId,
        params.parentPageIds,
      ).add(params.toJson(userId));

  Stream<List<BlocModel>> watchBlocs(
    String flugramId,
    List<String> parentPageIds,
  ) =>
      _getBlocsCollection(flugramId, parentPageIds).snapshots().map(
            (snapshot) => snapshot.docs.map(BlocModel.fromFirestore).toList(),
          );

  CollectionReference<Map<String, dynamic>> _getBlocsCollection(
    String flugramId,
    List<String> parentPageIds,
  ) {
    final pageId = parentPageIds.last;
    final newParentPageIds = parentPageIds.sublist(0, parentPageIds.length - 1);

    var collection =
        _firestore.collection('flugrams').doc(flugramId).collection(
              'pages',
            );

    for (final parentId in newParentPageIds) {
      collection = collection.doc(parentId).collection('pages');
    }

    return collection.doc(pageId).collection('blocs');
  }
}
