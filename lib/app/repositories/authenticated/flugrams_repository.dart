import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/authenticated_repository.dart';
import 'package:flugram/features/create_flugram/logic/create_flugram_bloc.dart';
import 'package:flugram/features/home/models/flugram_model.dart';

class FlugramsRepository extends AuthenticatedRepository {
  FlugramsRepository(
    this._firestore,
    super._authenticationRepository,
  );

  final FirebaseFirestore _firestore;

  Future<String> createFlugram(CreateFlugramParams params) async {
    final documentReference = await _flugramsCollection.add(
      params.toJson(userId),
    );

    await _firestore.collection('users').doc(userId).update({
      'flugrams': FieldValue.arrayUnion([documentReference.id]),
    });

    return documentReference.id;
  }

  Stream<List<FlugramModel>> watchFlugrams() {
    return _flugramsCollection
        .where('createdBy', isEqualTo: userId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(FlugramModel.fromFirestore).toList(),
        );
  }

  CollectionReference<Map<String, dynamic>> get _flugramsCollection {
    return _firestore.collection('flugrams');
  }
}
