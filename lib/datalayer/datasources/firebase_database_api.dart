import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';

class FirebaseDatabaseService {
  final String ? uid;

  FirebaseDatabaseService({this.uid});

  Future<void> saveUserData(FirebaseUserModel userData) async {
    FirebaseFirestore.instance
        .collection('tandiza_client')
        .doc(uid)
        .set(userData.toJson());
  }

  Future<FirebaseUserModel> getUserData() async {
    final userData =
    await FirebaseFirestore.instance.collection('tandiza_client').doc(uid).get();
    return FirebaseUserModel.fromJson(userData.data());
  }

  Future<void> updateUserData(Map<String, dynamic> userJsonMap) async {
    FirebaseFirestore.instance
        .collection('tandiza_client')
        .doc(uid)
        .update(userJsonMap);
  }
}