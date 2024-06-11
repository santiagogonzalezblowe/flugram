import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/home/models/page_model.dart';

class PageRepository extends AuthenticatedRepository {
  PageRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> deletePage(String flugramId, String pageId) =>
      _pageDocument(flugramId, pageId).delete();

  Future<void> updatePage(String flugramId, PageModel params) =>
      _pageDocument(flugramId, params.id).update(params.toJson);

  Stream<PageModel> watchPage(String flugramId, String pageId) =>
      _pageDocument(flugramId, pageId).snapshots().map(
            PageModel.fromFirestore,
          );

  Future<PageModel> getPage(String flugramId, String pageId) async {
    final snapshot = await _pageDocument(flugramId, pageId).get();
    return PageModel.fromFirestore(snapshot);
  }

  DocumentReference<Map<String, dynamic>> _pageDocument(
    String flugramId,
    String pageId,
  ) {
    return _firestore
        .collection('flugrams')
        .doc(flugramId)
        .collection('pages')
        .doc(pageId);
  }
}
