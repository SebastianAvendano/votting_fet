import 'package:cloud_firestore/cloud_firestore.dart';

abstract class VottingInterface {
  Stream<QuerySnapshot>? getAllDocuments();
  Future<bool> createElection(Map<String, dynamic> maintenance);
  Future<bool> setRecord(String path, Map<String, dynamic> data);
}
