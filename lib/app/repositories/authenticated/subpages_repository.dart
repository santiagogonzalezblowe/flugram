import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/create_subpage/logic/create_subpage_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';

class SubpagesRepository extends AuthenticatedRepository {
  SubpagesRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> createSubpage(
    String flugramId,
    CreateSubpageParams params,
  ) =>
      _getSubpagesCollection(
        flugramId,
        params.parentPageIds,
      ).add(params.toJson(userId));

  Stream<List<PageModel>> watchSubpages(
    String flugramId,
    List<String> parentPageIds,
  ) =>
      _getSubpagesCollection(flugramId, parentPageIds).snapshots().map(
            (snapshot) => snapshot.docs.map(PageModel.fromFirestore).toList(),
          );

  CollectionReference<Map<String, dynamic>> _getSubpagesCollection(
    String flugramId,
    List<String> parentPageIds,
  ) {
    var collection =
        _firestore.collection('flugrams').doc(flugramId).collection(
              'pages',
            );
    for (final parentId in parentPageIds) {
      collection = collection.doc(parentId).collection('pages');
    }
    return collection;
  }
}
