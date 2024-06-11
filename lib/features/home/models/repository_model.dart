import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/extension/firestore_data_extension.dart';

class RepositoryModel {
  RepositoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdBy,
    required this.createdAt,
  });

  factory RepositoryModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();

    if (data == null) throw StateError('Document does not exist');

    return RepositoryModel(
      id: doc.id,
      name: data.getString('name'),
      description: data.getString('description'),
      createdBy: data.getString('createdBy'),
      createdAt: data.getTimestamp('createdAt'),
    );
  }

  RepositoryModel copyWith({
    String? name,
    String? description,
    String? path,
  }) {
    return RepositoryModel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdBy: createdBy,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> get toJson {
    return {
      'name': name,
      'description': description,
      'createdBy': createdBy,
      'createdAt': createdAt,
    };
  }

  final String id;
  final String name;
  final String description;
  final String createdBy;
  final Timestamp createdAt;
}
