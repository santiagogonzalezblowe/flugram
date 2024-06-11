import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flugram/app/extension/firestore_data_extension.dart';

class FlugramModel {
  FlugramModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdBy,
    required this.createdAt,
  });

  factory FlugramModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();

    if (data == null) throw StateError('Document does not exist');

    return FlugramModel(
      id: doc.id,
      name: data.getString('name'),
      description: data.getString('description'),
      createdBy: data.getString('createdBy'),
      createdAt: data.getTimestamp('createdAt'),
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

  FlugramModel copyWith({
    String? name,
    String? description,
  }) {
    return FlugramModel(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdBy: createdBy,
      createdAt: createdAt,
    );
  }

  final String id;
  final String name;
  final String description;
  final String createdBy;
  final Timestamp createdAt;
}
