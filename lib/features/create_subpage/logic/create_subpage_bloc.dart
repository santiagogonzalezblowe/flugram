import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/subpages_repository.dart';

class CreateSubpageBloc extends BloweLoadBloc<void, CreateSubpageParams> {
  CreateSubpageBloc(this._subpagesRepository, this._flugramId);

  final SubpagesRepository _subpagesRepository;
  final String _flugramId;

  @override
  Future<void> load(CreateSubpageParams params) {
    return _subpagesRepository.createSubpage(_flugramId, params);
  }
}

class CreateSubpageParams {
  CreateSubpageParams(
    this.name,
    this.description,
    this.path,
    this.parentPageIds,
  );

  final String name;
  final String description;
  final String path;
  final List<String> parentPageIds;

  Map<String, dynamic> toJson(String userId) {
    return {
      'name': name,
      'description': description,
      'path': path,
      'createdAt': Timestamp.now(),
      'createdBy': userId,
      'parentPageIds': parentPageIds,
    };
  }
}
