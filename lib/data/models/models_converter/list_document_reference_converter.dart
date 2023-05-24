import 'package:cloud_firestore/cloud_firestore.dart';

class ListReferenceConverter {
  const ListReferenceConverter();

  static List<DocumentReference>? fromJsonListDocumentReference(
      List<dynamic>? list) {
    return list?.map((e) => e as DocumentReference).toList();
  }

  static List<DocumentReference>? toJsonListDocumentReference(
      List<dynamic>? list) {
    return list?.map((e) => e as DocumentReference).toList();
  }
}
