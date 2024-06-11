import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/home/models/flugram_model.dart';

class FlugramRepository extends AuthenticatedRepository {
  FlugramRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<void> deleteFlugram(String id) {
    return _flugramDocument(id).delete();
  }

  Future<void> updateFlugram(FlugramModel params) =>
      _flugramDocument(params.id).update(
        params.toJson,
      );

  Stream<FlugramModel> watchFlugram(String id) =>
      _flugramDocument(id).snapshots().map(
            FlugramModel.fromFirestore,
          );

  Future<FlugramModel> loadFlugram(String id) async {
    final snapshot = await _flugramDocument(id).get();
    return FlugramModel.fromFirestore(snapshot);
  }

  DocumentReference<Map<String, dynamic>> _flugramDocument(String id) {
    return _firestore.collection('flugrams').doc(id);
  }
}
