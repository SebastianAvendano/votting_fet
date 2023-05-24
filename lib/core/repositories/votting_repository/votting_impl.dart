import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'votting_interface.dart';

@injectable
class VottingInterfaceImpl implements VottingInterface {
  final Logger _logger;
  final FirebaseFirestore _firestore;

  final _keyCollectionElections = "elections";

  VottingInterfaceImpl(this._firestore, this._logger);

  @override
  Stream<QuerySnapshot>? getAllDocuments() {
    try {
      return _firestore.collection(_keyCollectionElections).snapshots();
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<bool> createElection(Map<String, dynamic> instruction) async {
    try {
      await _firestore.collection(_keyCollectionElections).add(instruction);
      return true;
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Future<bool> setRecord(String path, Map<String, dynamic> data) async {
    try {
      await _firestore.doc(path).update(data);
      return true;
    } on FirebaseAuthException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }
}
