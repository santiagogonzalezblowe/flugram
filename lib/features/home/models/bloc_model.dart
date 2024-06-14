import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/extension/firestore_data_extension.dart';

class BlocModel {
  BlocModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdBy,
    required this.createdAt,
    required this.repositoryIds,
  });

  factory BlocModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();

    if (data == null) throw StateError('Document does not exist');

    return BlocModel(
      id: doc.id,
      name: data.getString('name'),
      description: data.getString('description'),
      createdBy: data.getString('createdBy'),
      createdAt: data.getTimestamp('createdAt'),
      repositoryIds: data.getList<String>('repositoryIds') ?? [],
    );
  }

  BlocModel copyWith({
    String? name,
    String? description,
    List<String>? repositoryIds,
  }) {
    return BlocModel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdBy: createdBy,
      createdAt: createdAt,
      repositoryIds: repositoryIds ?? this.repositoryIds,
    );
  }

  Map<String, dynamic> get toJson {
    return {
      'name': name,
      'description': description,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'repositoryIds': repositoryIds,
    };
  }

  final String id;
  final String name;
  final String description;
  final String createdBy;
  final Timestamp createdAt;
  final List<String> repositoryIds;
}
