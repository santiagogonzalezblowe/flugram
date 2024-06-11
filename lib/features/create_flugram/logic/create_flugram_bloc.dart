import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/flugrams_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class CreateFlugramBloc extends BloweLoadBloc<String, CreateFlugramParams> {
  CreateFlugramBloc(this._appsRepository);

  final FlugramsRepository _appsRepository;

  @override
  Future<String> load(CreateFlugramParams params) {
    return _appsRepository.createFlugram(params);
  }
}

class CreateFlugramParams {
  CreateFlugramParams(
    this.name,
    this.description,
  );

  final String name;
  final String description;

  Map<String, dynamic> toJson(String userId) {
    return {
      'createdAt': Timestamp.now(),
      'createdBy': userId,
      'name': name,
      'description': description,
    };
  }
}
