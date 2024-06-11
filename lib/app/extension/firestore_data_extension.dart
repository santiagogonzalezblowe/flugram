import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreDataExtension on Map<String, dynamic> {
  String getString(String key) {
    final value = this[key];
    if (value is! String) throw StateError('Expected a string for key $key');
    return value;
  }

  List<T>? getList<T>(String key) {
    final value = this[key];
    if (value is! List) return null;
    return value.cast<T>();
  }

  Timestamp getTimestamp(String key) {
    final value = this[key];
    if (value is! Timestamp) {
      throw StateError('Expected a timestamp for key $key');
    }
    return value;
  }
}
