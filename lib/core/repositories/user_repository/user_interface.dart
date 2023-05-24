import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:votting/data/models/user/user_model.dart';

abstract class UserInterface {
  Future<QuerySnapshot?> findFcmToken(String token);
  Future<DocumentSnapshot<UserModel>?>? getUser(String id);
  Future<bool> updateUser(String id, Map<String, dynamic> data);
  Future<Stream<DocumentSnapshot<UserModel>>?> getUserStream(String id);
  Stream<DocumentSnapshot<UserModel>>? getUserSnapshot(String id);
  Future<bool>? createUser(String id, Map<String, dynamic> data);
  Future<QuerySnapshot<Map<String, dynamic>>?> getRol(String key);
}
