import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/create_page/logic/create_page_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';

class PagesRepository extends AuthenticatedRepository {
  PagesRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> createPage(String flugramId, CreatePageParams params) {
    return _pagesCollection(flugramId).add(params.toJson(userId));
  }

  Stream<List<PageModel>> watchPages(String flugramId) {
    return _pagesCollection(flugramId).snapshots().map(
          (snapshot) => snapshot.docs.map(PageModel.fromFirestore).toList(),
        );
  }

  CollectionReference<Map<String, dynamic>> _pagesCollection(String flugramId) {
    return _firestore.collection('flugrams').doc(flugramId).collection('pages');
  }
}
