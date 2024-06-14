import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/extension/firestore_data_extension.dart';

class PageModel {
  PageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.path,
    required this.createdBy,
    required this.createdAt,
    required this.parentPageIds,
  });

  factory PageModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();

    if (data == null) throw StateError('Document does not exist');

    return PageModel(
      id: doc.id,
      name: data.getString('name'),
      description: data.getString('description'),
      path: data.getString('path'),
      createdBy: data.getString('createdBy'),
      createdAt: data.getTimestamp('createdAt'),
      parentPageIds: data.getList('parentPageIds') ?? [],
    );
  }

  PageModel copyWith({
    String? name,
    String? description,
    String? path,
  }) {
    return PageModel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      path: path ?? this.path,
      createdBy: createdBy,
      createdAt: createdAt,
      parentPageIds: parentPageIds,
    );
  }

  Map<String, dynamic> get toJson {
    return {
      'name': name,
      'description': description,
      'path': path,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'parentPageIds': parentPageIds,
    };
  }

  final String id;
  final String name;
  final String description;
  final String path;
  final String createdBy;
  final Timestamp createdAt;
  final List<String> parentPageIds;
}
