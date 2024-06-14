import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/home/models/page_model.dart';

class SubpageRepository extends AuthenticatedRepository {
  SubpageRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> deleteSubpage(
    String flugramId,
    String pageId,
    List<String> parentPageIds,
  ) =>
      _getSubpageDocument(flugramId, pageId, parentPageIds).delete();

  Future<void> updatePage(
    String flugramId,
    PageModel params,
    List<String> parentPageIds,
  ) =>
      _getSubpageDocument(
        flugramId,
        params.id,
        parentPageIds,
      ).update(params.toJson);

  Stream<PageModel> watchPage(
    String flugramId,
    String pageId,
    List<String> parentPageIds,
  ) =>
      _getSubpageDocument(flugramId, pageId, parentPageIds).snapshots().map(
            PageModel.fromFirestore,
          );

  Future<PageModel> getPage(
    String flugramId,
    String pageId,
    List<String> parentPageIds,
  ) async {
    final snapshot = await _getSubpageDocument(
      flugramId,
      pageId,
      parentPageIds,
    ).get();
    return PageModel.fromFirestore(snapshot);
  }

  DocumentReference<Map<String, dynamic>> _getSubpageDocument(
    String flugramId,
    String pageId,
    List<String> parentPageIds,
  ) {
    var collection =
        _firestore.collection('flugrams').doc(flugramId).collection(
              'pages',
            );
    for (final parentId in parentPageIds) {
      collection = collection.doc(parentId).collection('pages');
    }
    return collection.doc(pageId);
  }
}
