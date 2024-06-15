import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/repositories/authenticated/pages_repository.dart';

class CreatePageBloc extends BloweLoadBloc<void, CreatePageParams> {
  CreatePageBloc(
    this._pagesRepository,
    this._flugramId,
  );

  final PagesRepository _pagesRepository;
  final String _flugramId;

  @override
  Future<void> load(CreatePageParams params) {
    return _pagesRepository.createPage(_flugramId, params);
  }
}

class CreatePageParams {
  CreatePageParams(
    this.name,
    this.description,
    this.path,
  );

  final String name;
  final String description;
  final String path;

  Map<String, dynamic> toJson(String userId) {
    return {
      'name': name,
      'description': description,
      'path': path,
      'createdAt': Timestamp.now(),
      'createdBy': userId,
      'parentPageIds': [],
    };
  }
}
