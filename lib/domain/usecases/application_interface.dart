import 'package:flutter/cupertino.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../../datalayer/models/tandiza_client_model.dart';
import '../models/tandiza_client_entity.dart';

abstract class IUserInterface {
  Future<TandizaClient?> getUserByNrc(String ? id);
  Future<FirebaseUserEntity?> signInWithPhone({String phoneNumber,
    required BuildContext context,
    TandizaClient ? tandizaClient,
    int clientId,
    String ? firstName,
    String ? result,
    String ? surname,
    String ? nrcNumber,
    String ? dateOfBirth});
  Stream<FirebaseUserEntity?> ? authStateChanges();
  Future<void> signOut();
  Future<void> ? updateFirebaseUserData(FirebaseUserModel userModel);
  Future<FirebaseUserModel?> getFirebaseUserData();
}